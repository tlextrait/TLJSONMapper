//
//  DecimalUtilTests.swift
//  TLJSONMapper
//
//  Created by Thomas Lextrait (Personal) on 1/19/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import TLJSONMapper

class DecimalUtilTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    /*
    func testIsDecimal() {
        XCTAssertFalse(DecimalUtil.isDecimal(obj: 1))
        XCTAssertFalse(DecimalUtil.isDecimal(obj: 17))
        XCTAssertFalse(DecimalUtil.isDecimal(obj: -99))
        XCTAssertFalse(DecimalUtil.isDecimal(obj: 0))
        XCTAssertFalse(DecimalUtil.isDecimal(obj: Int(16.1)))
        XCTAssertFalse(DecimalUtil.isDecimal(obj: Int32(16.1)))
        XCTAssertFalse(DecimalUtil.isDecimal(obj: Int64(16.1)))
        
        XCTAssertTrue(DecimalUtil.isDecimal(obj: 1.0))
        XCTAssertTrue(DecimalUtil.isDecimal(obj: 1.16))
        XCTAssertTrue(DecimalUtil.isDecimal(obj: 99.00001))
        XCTAssertTrue(DecimalUtil.isDecimal(obj: -16.1))
        XCTAssertTrue(DecimalUtil.isDecimal(obj: 0.018))
        XCTAssertTrue(DecimalUtil.isDecimal(obj: Double(16)))
        XCTAssertTrue(DecimalUtil.isDecimal(obj: Float(77)))
        XCTAssertTrue(DecimalUtil.isDecimal(obj: Float32(88)))
        XCTAssertTrue(DecimalUtil.isDecimal(obj: Float64(99)))
        XCTAssertTrue(DecimalUtil.isDecimal(obj: Float80(-17)))
        XCTAssertTrue(DecimalUtil.isDecimal(obj: M_PI))
    }
    
    func testDecimalToIntegerShouldNotBeNilIfValid() {
        guard let _: Int = DecimalUtil.decimalToInteger(obj: 1.16) else {
            XCTFail()
            return
        }
        
        guard let _: Int32 = DecimalUtil.decimalToInteger(obj: 1.16) else {
            XCTFail()
            return
        }
        
        guard let _: Int64 = DecimalUtil.decimalToInteger(obj: 1.16) else {
            XCTFail()
            return
        }
        
        guard let _: Int8 = DecimalUtil.decimalToInteger(obj: 1.16) else {
            XCTFail()
            return
        }
        
        guard let _: UInt = DecimalUtil.decimalToInteger(obj: 1.16) else {
            XCTFail()
            return
        }
        
        guard let _: Int = DecimalUtil.decimalToInteger(obj: 1.0) else {
            XCTFail()
            return
        }
        
        guard let _: Int = DecimalUtil.decimalToInteger(obj: Float(99)) else {
            XCTFail()
            return
        }
        
        guard let _: Int = DecimalUtil.decimalToInteger(obj: Double(76)) else {
            XCTFail()
            return
        }
        
        guard let _: Int = DecimalUtil.decimalToInteger(obj: Float80(-19)) else {
            XCTFail()
            return
        }
    }
    
    func testDecimalToInteger() {
        XCTAssertEqual(DecimalUtil.decimalToInteger(obj: 1.0), 1)
    }
    */
}
