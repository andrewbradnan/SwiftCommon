/**
 # String-Extension.swift
## SwiftCommon
 
 - Author: Andrew Bradnan
 - Date: 5/25/16
 - Copyright: Copyright © 2016 Belkin. All rights reserved.
 */

import Foundation

extension String {
    /**
     Remove the characters from a string.
     
    '''
    let aString = "She was a soul stripper. She took my heart!"
    let chars: [Character] = ["a", "e", "i"]
 
    println(aString.stripCharacters(chars))
    '''
    */
    public func stripCharacters(chars: Set<Character>) -> String {
        return String(self.characters.filter({ !chars.contains($0)}))
    }
    
    /// indexOf(ch)
    public func indexOf(char: Character) -> String.Index? {
        return self.characters.indexOf(char)
    }
    
    // spit out the string in ascii.  not sure how to make hex, it's decimal atm.
    public func toAsciiString() -> String {
        var rt = ""
        
        for ch in characters {
            rt += "\(ch) "
        }
        
        return rt
    }
    
    /// byte length
    public var countBytes: Int { return self.unicodeScalars.count }
    
    /// string length
    public var length: Int { return self.characters.count }
    
    /// easy NSRange for the string
    public var all: NSRange { get { return NSMakeRange(0, self.length) } }
    /// NSRange for all the bytes in a string
    public var allBytes: NSRange { get { return NSMakeRange(0, self.countBytes) } }
    
    /// search and replace using regex
    public func searchReplace(search: String, replace: String, options: NSRegularExpressionOptions = .CaseInsensitive) -> String {
        do {
            let expr = try NSRegularExpression(pattern: search, options: options)
            
            let replacement = expr.stringByReplacingMatchesInString(self, options: NSMatchingOptions(), range: self.allBytes, withTemplate: replace)
            
            return replacement
        }
        catch {
            return self
        }
    }
    
    /// get a substring the normal way
    public func substring(start: Int, end: Int) -> String {
        let r = self.startIndex.advancedBy(start)..<self.startIndex.advancedBy(end)
        return self.substringWithRange(r)
    }
    
    /// get a substring using a NSRange
    public func substring(r: NSRange) -> String {
        return self.substring(r.location, end: r.location + r.length)
    }
}
