/*
//
//  JSONMapper.swift
//  Pods
//
//  Created by Thomas Lextrait on 1/18/17.
//
//
 
 Copyright (c) 2017 Thomas Lextrait <thomas.lextrait@gmail.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import UIKit

open class JSONMapper: NSObject {
    
    // MARK: Parsing
    
    /**
     Parses and maps JSON from raw data to desired object
     - parameter jsonData: raw JSON data
     - parameter error: error object if a parsing error occurs
     - returns: T? or nil if given data is nil or empty, or error occurs
     */
    open static func parseMap<T>(jsonData: Data?, error: inout Error?) -> T? {
        if jsonData == nil || jsonData!.count == 0 {
            return nil
        }
        var t: Any?
        do {
            t = try JSONSerialization.jsonObject(with: jsonData!, options: [JSONSerialization.ReadingOptions.mutableContainers, JSONSerialization.ReadingOptions.allowFragments])
        } catch let parseError as Error {
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
        var err: Error?
        return parseMap(jsonData: jsonData, error: &err)
    }
    
    /**
     Parses and maps JSON from a string to desired object
     - parameter jsonString: JSON in string format
     - parameter error: error object if a parsing error occurs
     - returns: T? or nil if given data is nil or empty, or error occurs
     */
    open static func parseMap<T>(jsonString: String, error: inout Error?, encoding: String.Encoding = .utf8, allowLossyConversion: Bool = false) -> T? {
        let data = jsonString.data(using: encoding, allowLossyConversion: allowLossyConversion)
        return parseMap(jsonData: data, error: &error)
    }
    
    /**
     Parses and maps JSON from a string to desired object
     - parameter jsonString: JSON in string format
     - returns: T? or nil if given data is nil or empty, or error occurs
    */
    open static func parseMap<T>(jsonString: String, encoding: String.Encoding = .utf8, allowLossyConversion: Bool = false) -> T? {
        var err: Error?
        return parseMap(jsonString: jsonString, error: &err, encoding: encoding, allowLossyConversion: allowLossyConversion)
    }
    
    // MARK: Mapping

    /**
     Maps given parsed JSON (dictionary, array or value) to object to desired type
     - parameter json: parsed json (a dictionary, an array or a value)
     - returns: object of desired type, or nil if given null or if error occurs
    */
    open static func map<T>(json: Any) -> T? {
        if json == nil {
            return nil
        }
        
        /*
        // When converting doubles to ints, round them
        if T.self is IntegerType &&
            json is Roundable,
            var roundable = json as? Roundable {
            let rounded: Int64? = roundable.toInteger()
            return AnyIntegerInitializable.from(rounded!)
        }
        */
        
        // If json is the object type we want then just return it
        if json is T, let primitive: T = json as? T {
            return primitive
        }
        
        //
        // @TODO
        //
        
        return nil
    }
    
    /**
     Maps an array of JSON objects to an array of desired objects
     - parameter json:
     - returns: array of T, or nil if error occurred
    */
    open static func map<T>(json: Any, skipUnmappable: Bool = true) -> [T]? {
        guard let arr = json as? [Any] else {
            return nil
        }
        
        var mapped = [T]()
        for item in arr {
            guard let t: T = map(json: item) else {
                if skipUnmappable {
                    continue
                } else {
                    return nil
                }
            }
            mapped.append(t)
        }
        
        return mapped
    }
    
}
