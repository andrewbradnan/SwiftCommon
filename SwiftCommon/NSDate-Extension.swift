/**
 # NSDate-Extension.swift
## SwiftCommon
 
 - Copyright:   Copyright © 2016 Belkin. All rights reserved.
 */

import Foundation

extension NSDate {
    public func hoursFrom(date:NSDate) -> Int {
        return NSCalendar.currentCalendar().components(NSCalendarUnit.Hour, fromDate: date, toDate: self, options: NSCalendarOptions()).hour
    }
}
