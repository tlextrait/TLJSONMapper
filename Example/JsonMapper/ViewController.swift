/*
//
//  ViewController.swift
//  JsonMapper
//
//  Created by Thomas Lextrait on 11/26/2016.
//  Copyright (c) 2017 Thomas Lextrait. All rights reserved.
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
import TLJSONMapper

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let string: String? = JsonMapper.map(json: "hello world!")
        assert(string == "hello world!")
        
        let null: Any? = JsonMapper.map(json: "null")
        assert(null == nil)
        
        let bool1: Bool? = JsonMapper.map(json: "true")
        assert(bool1 != nil)
        assert(bool1! == true)
        
        let bool2: Bool? = JsonMapper.map(json: "false")
        assert(bool2 != nil)
        assert(bool2! == false)
        
        
    }

}

