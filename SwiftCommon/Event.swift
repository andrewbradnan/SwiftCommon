/**
 # Event.swift
 ## SwiftCommon
 
 - Author: Andrew Bradnan
 - Date: 6/7/16
 - Copyright:
 */

import Foundation

/**
 ## Event
 
 This is basically a C# event.  Delegates can only call back one sink.  This will mux.
 
 - Parameter T: the type of event to fire
 
 ```
 var mouseClick: Event<CGPoint>
 
 mouseClick.append("myfunc", .FireOnce) { t in ...}
 
 // source
 mouseClick.fire(location)
 ```
 */
public class Event<T> {
    public typealias EventBlock = (T)->Void
    var events : [LambdaCallback<T>] = []
    var triggerType: EventTriggerType
    var param: T!
    
    public init (manual: Bool = false) {
        self.triggerType = .Manual(false)
    }
    
    func removeAll(keepCapacity: Bool) {
        events.removeAll(keepCapacity: false)
    }
    
    public func append(dbg: String, life: EventLifeCycle, block: EventBlock) {
        if case .Manual(let eventSet) = self.triggerType && eventSet == true {
            block(self.param)
            
            // if we aren't FireOnce, then add to the list of events
            if !life.contains(.FireOnce) {
                events.append(LambdaCallback<T>(dbg: dbg, block: block, life: life))
            }
        }
        else {
            events.append(LambdaCallback<T>(dbg: dbg, block: block, life: life))
        }
    }
    
    public func fire(param: T) {
        if case .Manual(_) = self.triggerType {
            self.triggerType = .Manual(true)
            self.param = param
        }
        
        var fired: Bool = false
        self.events = notify(self.events, ffwd: false, fired: &fired, fire: { $0.fire(param) })
    }
}

public struct EventLifeCycle : OptionSet {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    
    public static let Permanent = EventLifeCycle(rawValue: 1)
    public static let FireOnce = EventLifeCycle(rawValue: 2)
    public static let Skipable = EventLifeCycle(rawValue: 4)
}

protocol EventType {
    var lifeCycle: EventLifeCycle { get }
}

extension EventType {
    var isFireOnce: Bool { get { return self.lifeCycle.contains(.FireOnce) }}
    var isSkipable: Bool { get { return self.lifeCycle.contains(.Skipable) }}
}

func notify<C: CollectionType>(events: C, ffwd: Bool, fired: inout Bool, fire: C.Generator.Element->Void) -> [C.Generator.Element] where C.Generator.Element : EventType {
    var rt: [C.Generator.Element] = []
    fired = false
    
    for e in events {
        if !ffwd || !e.isSkipable {
            fired = true
            fire(e)
        }
        if !e.isFireOnce {
            rt.append(e)
        }
    }
    return rt
}

protocol EventParamType : EventType {
    associatedtype Element
    func fire(param: Element)
}

class LambdaCallback<T> : EventParamType {
    let block : T->Void
    let lifeCycle : EventLifeCycle
    
    internal let dbg: String
    init(dbg: String, block: T->Void, life: EventLifeCycle)
    {
        self.dbg = dbg
        self.block = block
        self.lifeCycle = life
    }
    
    func fire(param: T) { block(param) }
}

enum EventTriggerType {
    case Auto
    case Manual(Bool)   // set or not
}
