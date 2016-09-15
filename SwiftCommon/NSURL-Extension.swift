/**
 # NSURL-Extension.swift
## SwiftCommon
 
 - Author: Andrew Bradnan
 - Date: 7/8/16
 - Copyright: Me 
 */

import Foundation

extension NSURL {
    func ensureTrailingSlash() -> NSURL {
        if let p = self.path {
            if p.length > 0 && !self.absoluteString!.hasSuffix("/") {
                return self.URLByAppendingPathComponent("")!
            }
        }
        return self
    }
}
