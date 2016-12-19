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
    
    /**
     Encode a String to Base64
     */
    func toBase64() -> String {
        let data = self.dataUsingEncoding(NSUTF8StringEncoding)
        return data!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
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

    public func numberOfMatches(search: String, options: NSRegularExpressionOptions = .CaseInsensitive) -> Int {
        do {
            let expr = try NSRegularExpression(pattern: search, options: options)
            
            let matches = expr.numberOfMatchesInString(self, options: NSMatchingOptions(), range: self.allBytes)
            
            return matches
        }
        catch {
            return 0
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
    
    /// is not nil or emtpy
    static func isNotEmpty(s: String?) -> Bool {
        return !(s?.isEmpty ?? true)
    }

    /// return array of strings of every 2 chars
    public var pairs: [String] {
        var result: [String] = []
        let chars = Array(characters)
        for index in 0.stride(to: chars.count, by: 2) {
            result.append(String(chars[index..<min(index+2, chars.count)]))
        }
        return result
    }
    
    /// find the last char
    public func lastIndexOf(c: Character) -> Index? {
        if let r: Range<Index> = self.rangeOfString(String(c), options: .BackwardsSearch) {
            return r.startIndex
        }
        
        return nil
    }
    
    // return a filename
    public var pathFileName: String? {
        if let idx = self.lastIndexOf("/") {
            return self.substringFromIndex(idx.advancedBy(1))
        }
        return nil
    }

}
