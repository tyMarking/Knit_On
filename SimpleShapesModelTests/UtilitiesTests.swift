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
    }
}
