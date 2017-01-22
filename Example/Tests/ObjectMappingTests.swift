//
//  ObjectMappingTests.swift
//  TLJSONMapper
//
//  Created by Thomas Lextrait (Personal) on 1/19/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import TLJSONMapper

class House: NSObject {
    var name: String?
}

class ObjectMappingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMapHouse() {
        let house: House? = JSONMapper.parseMap(jsonString: "{\"name\":\"hello world\"}")
        if house == nil {
            XCTFail()
        } else {
            XCTAssertEqual(house?.name, "hello world")
        }
    }
    
}
