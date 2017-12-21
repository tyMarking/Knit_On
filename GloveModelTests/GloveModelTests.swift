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
        
        // Set General Properties
        pattern.title = "Brooke's Christmas Gloves"
        pattern.patternDescription = "Brooke’s Christmas present 2017, to match a cabled hat I made her. Yarn: The Fibre Co’s Acadia in the Mountain Ash colorway. Needles: US 6"
        pattern.gauge = Gauge(stitchGauge: 6.0)
        pattern.handSize = WomanXSmallHand()
        pattern.ease = 0
        
        // Set Arm Configuration Properties
        var armConfig = GloveArmConfig()
        armConfig.armLength = GloveArmConfig.ArmLength.short
        armConfig.isWristShaping = false
        armConfig.cuffLength = 0
        armConfig.armStitchPattern = TwoByTwoRib()
        armConfig.armStitchPattern.isRowByRow = false
        pattern.armConfig = armConfig
        
        // Set Thumb and Hand Configuration Properties
        var thumbHandConfig = ThumbHandConfig()
        let panelPattern: PanelStitchPattern = ThreeOverThreeDoubleCable()
        panelPattern.isRowByRow = false
        panelPattern.offsetStitches = 2
        panelPattern.alignment = PanelStitchPattern.PanelAlignment.OuterEdge
        thumbHandConfig.handStitchPattern = panelPattern
        pattern.thumbHandConfig = thumbHandConfig
        
        // Set Fingers Configuration Properties
        var fingersConfig = FingersConfig()
        fingersConfig.fingerCoverage = FingersConfig.FingerCoverage.standard // the default
        fingersConfig.isIndividualFingers = false // the default
        fingersConfig.edgingLength = 1 // the default
        fingersConfig.edgingStitchPattern = TwoByTwoRib()
        pattern.fingersConfig = fingersConfig
        
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
    
    
    func testBrookesGloves() {
        
        let pattern = self.setUpBrookesGlovePattern()
        XCTAssertFalse(pattern.isRightLeftInterchangable())
        
        let gloveArmInstructionGen = GloveArmInstructionGenerator()
        let castOnStitches = gloveArmInstructionGen.calculateCastOnStitches(pattern: pattern)
        
        XCTAssertEqual(castOnStitches % 4, 0, "Cast On Stitches not multiple of 4")
        
        //let gloveArm = pattern.armConfig
        //let handThumbConfig = pattern.thumbHandConfig
        
    }
    
    func testBrookesPatternStitchPatternInstructions() {
        let pattern = self.setUpBrookesGlovePattern()
        
        let gloveArm = pattern.armConfig
        let armStitchPattern = gloveArm.armStitchPattern
        NSLog(armStitchPattern.generateStitchPatternDescription())
        NSLog(armStitchPattern.generateStitchPatternInstructions())
        
        let handThumbConfig = pattern.thumbHandConfig
        let handStitchPattern = handThumbConfig.handStitchPattern
        NSLog(handStitchPattern.generateStitchPatternDescription())
        NSLog(handStitchPattern.generateStitchPatternInstructions())
    }
    
    func testBrookePatternInstructions() {
        let pattern = self.setUpBrookesGlovePattern()
        let gloveArmInstructionGen = GloveArmInstructionGenerator()
        
        gloveArmInstructionGen.generateInstructions(pattern: pattern)
        self.logInstructions(instructions: pattern.getInstructions())
    } 
    
}
