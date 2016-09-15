/**
 # NSDate-Extension.swift
## SwiftCommon
 
 - Copyright:   Copyright © 2016 Belkin. All rights reserved.
 */

import Foundation

extension Date {
    public func hoursFrom(_ date:Date) -> Int {
        let c = Calendar.current
        
        return c.dateComponents([Calendar.Component.hour], from: date, to: self).hour!
    }
}
