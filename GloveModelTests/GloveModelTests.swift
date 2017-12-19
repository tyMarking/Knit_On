//
//  GloveModelTests.swift
//  GloveModelTests
//
//  Created by CAROLYN STEELE on 12/19/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import XCTest
@testable import KnitOn

class GloveModelTests: XCTestCase {
    
    //MARK: Utility Methods
    
    private func setUpBrookesGlovePattern() -> GlovePattern {
        let pattern = GlovePattern()
        pattern.title = "Brooke's Christmas Gloves"
        pattern.gauge = Gauge(stitchGauge: 5.5)
        pattern.handSize = WomanXSmallHand()
        
        var armConfig = GloveArmConfig()
        armConfig.armLength = GloveArmConfig.ArmLength.short
        armConfig.isWristShaping = false
        armConfig.cuffLength = 0
        armConfig.armStitchPattern = TwoByTwoRib()
        
        pattern.armConfig = armConfig
        
        return pattern
    }
    
    private func logInstructions(instructions: [MarkupElement]) {
        for patternInstruction in instructions {
            NSLog(patternInstruction.getInstructions())
        }
    }
    
    //MARK: setUP & tearDown
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testBrookesGloves() {
        
        let pattern = self.setUpBrookesGlovePattern()
        
        let gloveArmInstructionGen = GloveArmInstructionGenerator()
        let castOnStitches = gloveArmInstructionGen.calculateCastOnStitches(pattern: pattern)
        
        XCTAssertEqual(castOnStitches, 36, "Cast On Stitches Incorrect")
        
        gloveArmInstructionGen.generateInstructions(pattern: pattern)
        self.logInstructions(instructions: pattern.getInstructions())
        
        //NSLog(instructionMarkUp)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
