//
//  UtilitiesTests.swift
//  SimpleShapesModelTests
//
//  Created by CAROLYN STEELE on 12/20/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import XCTest
@testable import KnitOn

class UtilitiesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsIntValue() {
        XCTAssertTrue(KnitOnUtils.isIntegerValue(value: 2.0))
        XCTAssertTrue(KnitOnUtils.isIntegerValue(value: 2))
        XCTAssertFalse(KnitOnUtils.isIntegerValue(value: 2.1))
    }
    
    func testIsEven() {
        XCTAssertTrue(KnitOnUtils.isEven(value: 2))
        XCTAssertFalse(KnitOnUtils.isEven(value: 3))
    }
    
    func testRoundingHelper() {
        
        var roundedVal = KnitOnUtils.roundingHelper(amtToRound: 3.12, toNearest: 0.25, fairness: 0.5)
        XCTAssertEqual(roundedVal, 3.0)
        
        roundedVal = KnitOnUtils.roundingHelper(amtToRound: 3.13, toNearest: 0.25, fairness: 0.5)
        XCTAssertEqual(roundedVal, 3.25)
        
        roundedVal = KnitOnUtils.roundToQuarterInch(amtToRound: 3.125)
        XCTAssertEqual(roundedVal, 3.25)
        
        roundedVal = KnitOnUtils.roundToQuarterInch(amtToRound: 3.375)
        XCTAssertEqual(roundedVal, 3.5)
        
        roundedVal = KnitOnUtils.roundToQuarterInch(amtToRound: 3.621)
        XCTAssertEqual(roundedVal, 3.5)
        
        roundedVal = KnitOnUtils.roundToQuarterInch(amtToRound: 3.7)
        XCTAssertEqual(roundedVal, 3.75)
        
        roundedVal = KnitOnUtils.roundToQuarterInch(amtToRound: 3.76)
        XCTAssertEqual(roundedVal, 3.75)
        
        roundedVal = KnitOnUtils.roundToQuarterInch(amtToRound: 3.88)
        XCTAssertEqual(roundedVal, 4.0)
        
        var intValue = 0
        
        intValue = KnitOnUtils.roundToInteger(amtToRound: 3.2)
        XCTAssertEqual(intValue, 3)
        
        intValue = KnitOnUtils.roundToInteger(amtToRound: 3.5)
        XCTAssertEqual(intValue, 4)
        
        intValue = KnitOnUtils.roundToInteger(amtToRound: 3.8)
        XCTAssertEqual(intValue, 4)
        
        intValue = KnitOnUtils.roundtoMultiple(amtToRound: 17, multipleOf: 4)
        XCTAssertEqual(intValue, 16)
        
        intValue = KnitOnUtils.roundtoMultiple(amtToRound: 18, multipleOf: 4)
        XCTAssertEqual(intValue, 20)
        
        intValue = KnitOnUtils.roundtoMultiple(amtToRound: 19, multipleOf: 4)
        XCTAssertEqual(intValue, 20)
        
        intValue = KnitOnUtils.roundtoMultiple(amtToRound: 20, multipleOf: 4)
        XCTAssertEqual(intValue, 20)
        
        intValue = KnitOnUtils.roundtoEven(amtToRound: 16.9)
        XCTAssertEqual(intValue, 16)
        
        intValue = KnitOnUtils.roundtoEven(amtToRound: 17)
        XCTAssertEqual(intValue, 18)
        
        intValue = KnitOnUtils.roundtoEven(amtToRound: 17.4)
        XCTAssertEqual(intValue, 18)
    }
}
