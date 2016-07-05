/**
 # Dispatch.swift
## SwiftCommon

 - Author: Andrew Bradnan
 - Date: 5/23/16
 - Copyright: © 2016 Belkin International. All rights reserved.
*/

public typealias Block = () -> Void

public func secondsFromNow(secs: Double) -> dispatch_time_t {
    return dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), Int64(secs * Double(NSEC_PER_SEC)))
}

/**
 Run this `Block` in N seconds (on the main queue).
 
 - Parameter secs: seconds from now.
 - Parameter block: closure to run.
 */
public func dispatch_after(secs: Double, block: Block) {
    dispatch_after(secondsFromNow(secs), dispatch_get_main_queue(), block)
}

/**
 Be sure and run on the main UI thread.and
 
 - Parameter block: the code to run.
 */
public func gui(block: Block) {
    if NSThread.isMainThread() {
        block()
    } else {
        dispatch_async(dispatch_get_main_queue()) {
            block()
        }
    }
}