/*
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
import XCTest
import TLJSONMapper

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMapString() {
        let string: String? = JSONMapper.map(json: "hello world!")
        XCTAssertEqual(string, "hello world!")
    }
    
    func testPerformanceMapString() {
        self.measure() {
            let string: String? = JSONMapper.map(json: "hello world!")
            XCTAssertEqual(string, "hello world!")
        }
    }
    
    func testParseMapJSONPrimitives() {
        let bool1: Bool? = JSONMapper.parseMap(jsonString: "true")
        if bool1 == nil {
            XCTFail()
        } else {
            XCTAssertTrue(bool1!)
        }
        
        let bool2: Bool? = JSONMapper.parseMap(jsonString: "false")
        if bool2 == nil {
            XCTFail()
        } else {
            XCTAssertFalse(bool2!)
        }
        
        let zero: Int? = JSONMapper.parseMap(jsonString: "0")
        XCTAssertEqual(zero, 0)
        
        let int: Int? = JSONMapper.parseMap(jsonString: "166")
        XCTAssertEqual(int, 166)
        
        let neg: Int? = JSONMapper.parseMap(jsonString: "-166")
        XCTAssertEqual(neg, -166)
        
        let double: Double? = JSONMapper.parseMap(jsonString: "3.1415")
        if double == nil {
            XCTFail()
        } else {
            XCTAssertEqual(round(double! * 10000) / 10000, 3.1415)
        }
        
        let null: Any? = JSONMapper.parseMap(jsonString: "null")
        XCTAssertTrue(null is NSNull)
    }
    
    func testParseMapJSONPrimitivesBadTypesShouldReturnNil() {
        let int1: Int? = JSONMapper.parseMap(jsonString: "true")
        XCTAssertNil(int1)
        
        let int2: Int? = JSONMapper.parseMap(jsonString: "false")
        XCTAssertNil(int2)
        
        let int3: Int? = JSONMapper.parseMap(jsonString: "null")
        XCTAssertNil(int3)
        
        let bool2: Bool? = JSONMapper.parseMap(jsonString: "null")
        XCTAssertNil(bool2)
    }
    
    func testParseMapNumbersShouldResolveToBools() {
        let bool1: Bool? = JSONMapper.parseMap(jsonString: "17")
        XCTAssertEqual(bool1, true)
        
        let bool2: Bool? = JSONMapper.parseMap(jsonString: "0")
        XCTAssertEqual(bool2, false)
        
        let bool3: Bool? = JSONMapper.parseMap(jsonString: "-1")
        XCTAssertEqual(bool3, true)
        
        let bool4: Bool? = JSONMapper.parseMap(jsonString: "17.87")
        XCTAssertEqual(bool4, true)
    }
    
    func testParseMapJSONPrimitivesSimilarNumberTypesShouldWork() {
        let int: Int? = JSONMapper.parseMap(jsonString: "3.99")
        if int == nil {
            XCTFail()
        } else {
            XCTAssertEqual(int, 3)
        }
        
        let int2: Int? = JSONMapper.parseMap(jsonString: "3.11")
        if int2 == nil {
            XCTFail()
        } else {
            XCTAssertEqual(int2, 3) // Mapper should truncate 3.11 to 3 if asking for an Int
        }
        
        let double: Double? = JSONMapper.parseMap(jsonString: "7")
        if double == nil {
            XCTFail()
        } else {
            XCTAssertEqual(double, 7.0)
        }
    }
    
    func testParseMapArrayOfValues() {
        let arr: [Int]? = JSONMapper.parseMap(jsonString: "[1,2,3,4,5]")
        if arr == nil {
            XCTFail()
        } else {
            XCTAssertEqual(arr!.count, 5)
            XCTAssertEqual(arr![0], 1)
            XCTAssertEqual(arr![1], 2)
            XCTAssertEqual(arr![2], 3)
            XCTAssertEqual(arr![3], 4)
            XCTAssertEqual(arr![4], 5)
        }
        
        let arr2: [Double]? = JSONMapper.parseMap(jsonString: "[1.1,2.2,3.3,4.4,5.5]")
        if arr2 == nil {
            XCTFail()
        } else {
            XCTAssertEqual(arr2!.count, 5)
            XCTAssertEqual(arr2![0], 1.1)
            XCTAssertEqual(arr2![1], 2.2)
            XCTAssertEqual(arr2![2], 3.3)
            XCTAssertEqual(arr2![3], 4.4)
            XCTAssertEqual(arr2![4], 5.5)
        }
        
        let arr3: [String]? = JSONMapper.parseMap(jsonString: "[\"john\",\"doe\",\"annie\"]")
        if arr3 == nil {
            XCTFail()
        } else {
            XCTAssertEqual(arr3!.count, 3)
            XCTAssertEqual(arr3![0], "john")
            XCTAssertEqual(arr3![1], "doe")
            XCTAssertEqual(arr3![2], "annie")
        }
        
        let arr4: [Bool]? = JSONMapper.parseMap(jsonString: "[true, false, true]")
        if arr4 == nil {
            XCTFail()
        } else {
            XCTAssertEqual(arr4!.count, 3)
            XCTAssertEqual(arr4![0], true)
            XCTAssertEqual(arr4![1], false)
            XCTAssertEqual(arr4![2], true)
        }
    }
    
    func testParseMapNestedArraysOfValues() {
        let arr: [[Int]]? = JSONMapper.parseMap(jsonString: "[[1,2],[3,4],[5,6]]")
        if arr == nil {
            XCTFail()
        } else {
            XCTAssertEqual(arr!.count, 3)
            XCTAssertEqual(arr![0].count, 2)
            XCTAssertEqual(arr![0][0], 1)
            XCTAssertEqual(arr![0][1], 2)
            XCTAssertEqual(arr![1][0], 3)
            XCTAssertEqual(arr![1][1], 4)
            XCTAssertEqual(arr![2][0], 5)
            XCTAssertEqual(arr![2][1], 6)
        }
    }
    
    func testParseMapMismatchedTypeArrayShouldReturnNil() {
        let arr: [Int]? = JSONMapper.parseMap(jsonString: "[1,2,3,4,[9,9],5]")
        XCTAssertNil(arr)
        
        let arr2: [[Int]]? = JSONMapper.parseMap(jsonString: "[[1,2,3,4],[9,9],5]")
        XCTAssertNil(arr2)
    }
    
    func testParseMapMixedTypeArrayOfValues() {
        let arr: [AnyObject]? = JSONMapper.parseMap(jsonString: "[1,2,3,4,[9,9],5]")
        if arr == nil {
            XCTFail()
        } else {
            XCTAssertEqual(arr!.count, 6)
            XCTAssertEqual(arr![0] as? Int, 1)
            XCTAssert(arr![4] is NSArray)
        }
    }
    
}
