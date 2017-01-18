//
//  JsonMapper.swift
//  Pods
//
//  Created by Thomas Lextrait (Personal) on 1/18/17.
//
//

import UIKit

open class JsonMapper: NSObject {
    
    /**
     Parses and maps JSON from raw data to desired object
     - parameter jsonData: raw JSON data
     - parameter error: error object if a parsing error occurs
     - returns: T? or nil if given data is nil or empty, or error occurs
     */
    open static func parseMap<T>(jsonData: Data?, error: inout NSError?) -> T? {
        if jsonData == nil || jsonData!.count == 0 {
            return nil
        }
        var t: Any?
        do {
            t = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers)
        } catch let parseError as NSError {
            error = parseError
            return nil
        }
        if t == nil {
            return nil
        }
        return map(json: t)
    }
    
    /**
     Parses and maps JSON from raw data to desired object
     - parameter jsonData: raw JSON data
     - returns: T? or nil if given data is nil or empty, or error occurs
    */
    open static func parseMap<T>(jsonData: Data?) -> T? {
        var err: NSError?
        return parseMap(jsonData: jsonData, error: &err)
    }
    
    /**
     Parses and maps JSON from a string to desired object
     - parameter jsonString: JSON in string format
     - parameter error: error object if a parsing error occurs
     - returns: T? or nil if given data is nil or empty, or error occurs
     */
    open static func parseMap<T>(jsonString: String, error: inout NSError?) -> T? {
        
    }
    
    /**
     Parses and maps JSON from a string to desired object
     - parameter jsonString: JSON in string format
     - returns: T? or nil if given data is nil or empty, or error occurs
    */
    open static func parseMap<T>(jsonString: String) -> T? {
        var err: NSError?
        return parseMap(jsonString: jsonString, error: &err)
    }

    open static func map<T>(json: Any) -> T? {
        /*
         - is it an array of T?
         -
 
        */
        return nil
    }
    
}
