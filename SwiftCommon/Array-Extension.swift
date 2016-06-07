/**
 # Array-Extension.swift
 ##  SwiftCommon
 
 - Author: Andrew Bradnan
 - Date: 5/24/16
 - Copyright:   Copyright © 2016 Belkin. All rights reserved.
 */

import Foundation

extension SequenceType {
    /**
     Find the index of element using a predicate
     
     - Parameter predicate: This Element?
     - Returns: Index or .None
    */
    public func indexOf(predicate: Generator.Element -> Bool) -> Int? {
        for (idx, element) in self.enumerate() {
            if predicate(element) {
                return idx
            }
        }
        return nil
    }
}

extension SequenceType where Generator.Element : Equatable {
    
    /**
     Find the index of Equatable element.
     
     - Parameter e: The element to search for
     - Returns: Index or .None
     */
    public func indexOf(e: Generator.Element) -> Int? {
        for (idx, element) in self.enumerate() {
            if element == e {
                return idx
            }
        }
        return nil
    }
    
    /**
     Remove the Equatable element.
     
     - Parameter e: The element to search for
     - Returns: `true` or `false`
     */
    public mutating func remove(e: Generator.Element) -> Bool {
        if let idx = self.indexOf(e) {
            self.removeAtIndex(idx)
            return true
        }
        return false
    }
    
}
