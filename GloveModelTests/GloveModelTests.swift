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
    
    private func setUpCQCampingGlovePattern() -> GlovePattern {
        let pattern = GlovePattern()
        
        pattern.title = "CQ's Camping Mitts"
        pattern.patternDescription = "Sturdy mitts made for camping trip to Death Valley 2017"
        pattern.gauge = Gauge(stitchGauge: 5.25)
        pattern.handSize = WomanMediumHand()
        pattern.ease = 0
        
        var armConfig = GloveArmConfig()
        armConfig.armLength = GloveArmConfig.ArmLength.short
        armConfig.isWristShaping = false
        armConfig.cuffLength = 0
        armConfig.armStitchPattern = OneByOneRib()
        armConfig.armStitchPattern.isRowByRow = false
        pattern.armConfig = armConfig
        
        // Set Thumb and Hand Configuration Properties
        var thumbHandConfig = ThumbHandConfig()
        thumbHandConfig.thumbGusset = ThumbHandConfig.ThumbGusset.basicGusset // default
        pattern.thumbHandConfig = thumbHandConfig
        
        // Set Fingers Configuration Properties
        var fingersConfig = FingersConfig()
        fingersConfig.fingerCoverage = FingersConfig.FingerCoverage.standard // the default
        fingersConfig.isIndividualFingers = false // the default
        fingersConfig.edgingLength = 0.5
        fingersConfig.edgingStitchPattern = OneByOneRib()
        pattern.fingersConfig = fingersConfig
        
        return pattern
    }
    
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
        fingersConfig.edgingLength = 0.75 // the default
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
        let context = GloveInstructionContext(pattern: pattern)
        let gloveArmInstructionGen = GloveArmInstructionGenerator()
        
        gloveArmInstructionGen.generateInstructions(context: context)
        self.logInstructions(instructions: pattern.getInstructions())
    }
    
    func testCQsCampingMittsINstructions() {
        let pattern = self.setUpCQCampingGlovePattern()
        let context = GloveInstructionContext(pattern: pattern)
        let gloveInstrGen = GloveInstructionGenerator()
        
        gloveInstrGen.generateInstructions(context: context)
        self.logInstructions(instructions: pattern.getInstructions())
        
        // Thumb and Hand Numbers
        let thumbHandInstrGen = gloveInstrGen.thumbHandInstGen
        let numThumbGussetSts = thumbHandInstrGen.calculateNumberOfThumbStitches(gloveContext: context)
        let numThumbGussetIncRounds = thumbHandInstrGen.calculateNumberOfGussetIncreaseRounds(numGussetSts: numThumbGussetSts)
        let numThumbGussetRounds = thumbHandInstrGen.calculateNumberOfGussetRounds(numGussetSts: numThumbGussetSts)
        let lengthFromGussetToTopHand = thumbHandInstrGen.calculateLengthFromGussetToTopHand(gloveContext: context)
        NSLog("Num thumb stitches = " + String(numThumbGussetSts))
        NSLog("Num gusset increase rounds = " + String(numThumbGussetIncRounds))
        NSLog("Total number of rounds at end of thumb gusset = " + String(numThumbGussetRounds))
        NSLog("Length of hand above thumb gusset = " + String(lengthFromGussetToTopHand))
        
        // Finger Numbers
        let fingersInstrGen = gloveInstrGen.fingerInstGen
        let fingerConfig = pattern.fingersConfig
        let lengthFromGussetToTopFingers = fingersInstrGen.calculateFingerLengthFromGusset(gloveContext: context)
        let lengthFingerEdging = fingerConfig.edgingLength
        let lengthFromGussetToEdging = lengthFromGussetToTopFingers - lengthFingerEdging
        NSLog("Length from gusset to finger edging = " + String(lengthFromGussetToEdging))
        NSLog("Length of finger edging = " + String(lengthFingerEdging))
    }
    
}
