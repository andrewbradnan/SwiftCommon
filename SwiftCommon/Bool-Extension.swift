/**
 # Bool-Extension.swift
 ##  
 
 - Author: Andrew Bradnan
 - Date: 8/24/16
 - Copyright: 
 */

extension Bool {
    public func toFloat() -> Float {
        return self ? 1.0 : 0.0
    }
    public func toFloat() -> CGFloat {
        return self ? 1.0 : 0.0
    }
}