/**
 # CGSize-Extension.swift
## SwiftCommon
 
 - Author: Andrew Bradnan
 - Date: 5/23/16
 - Copyright: © 2016 Belkin International. All rights reserved.
 */

import Foundation

extension CGSize {
    /// Swap height & width
    public func swap() -> CGSize {
        return CGSizeMake(self.height, self.width)
    }
}
