/**
 # NSURL-Extension.swift
## SwiftCommon
 
 - Author: Andrew Bradnan
 - Date: 7/8/16
 - Copyright: Me 
 */

import Foundation

extension URL {
    func ensureTrailingSlash() -> URL {
        if self.path.length > 0 && !self.absoluteString.hasSuffix("/") {
            return self.appendingPathComponent("") //   URLByAppendingPathComponent("")!
        }
        return self
    }
}
