//
//  SimpleShapesModelTests.swift
//  SimpleShapesModelTests
//
//  Created by CAROLYN STEELE on 12/19/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import XCTest
@testable import KnitOn

class SimpleShapesModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGauge() {
        
        // Set stitch and row gauge
        var gauge = Gauge(stitchGauge: 5.5, rowGauge: 8)
        XCTAssertTrue(gauge.stitchGauge == 5.5)
        XCTAssertTrue(gauge.rowGauge == 8)
        XCTAssertFalse(gauge.getIsRowGaugeAutoGenerated())
        
        //Set stitch gauge only, row gauge automatically calculated
        gauge = Gauge(stitchGauge: 5)
        XCTAssertTrue(gauge.stitchGauge == 5)
        XCTAssertTrue(gauge.rowGauge == 4/3*5)
        XCTAssertTrue(gauge.getIsRowGaugeAutoGenerated())
    }
}
