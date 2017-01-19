/*
//
//  UrlSession+JsonTask.swift
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

public extension URLSession {

    /**
     Creates a data task that expects JSON to be returns and attempts to map it to desired object
     - parameter with: URL
     - parameter completionHandler
     - returns: URLSessionDataTask
    */
    open func jsonTask<T>(with: URL, completionHandler: @escaping (T?, URLResponse?, Error?)->Void) -> URLSessionDataTask {
        return dataTask(with: with, completionHandler: {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            URLSession.handle(data: data, response: response, error: error, completionHandler: completionHandler)
        })
    }
    
    /**
     Creates a data task that expects JSON to be returns and attempts to map it to desired object
     - parameter with: URLRequest
     - parameter completionHandler
     - returns: URLSessionDataTask
     */
    open func jsonTask<T>(with: URLRequest, completionHandler: @escaping (T?, URLResponse?, Error?)->Void) -> URLSessionDataTask {
        return dataTask(with: with, completionHandler: {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            URLSession.handle(data: data, response: response, error: error, completionHandler: completionHandler)
        })
    }
    
    private static func handle<T>(data: Data?, response: URLResponse?, error: Error?, completionHandler: (T?, URLResponse?, Error?)->Void) {
        
        if error != nil {
            completionHandler(nil, response, error)
            return
        }
        
        var parseError: Error?
        let t: T? = JSONMapper.parseMap(jsonData: data, error: &parseError)
        
        completionHandler(t, response, parseError)
    }
    
}
