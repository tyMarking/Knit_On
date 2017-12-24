//
//  GloveArmComponent.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 11/28/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//
//  Configurable Properties for a glove's "arm" section: from cast on to top of wrist
//      1) armLength -- enum: short, standard, long, or gauntlet (default: standard)
//      2) isWristShaping -- true or false (default: true)
//      3) cuffLength -- Float (default: 1 inch)
//      4) cuffStitchPattern -- subclass of StitchPattern; no default
//      5) armStitchPattern -- subclass of StitchPattern; defaults to StockinetteStitch
//
//  Open Questions
//      * Using enums with rawValue to represent different GloveArmLengths. Better way?

import Foundation
import UIKit

class GloveArmInstructionGenerator: InstructionGenerator {
    
    //MARK: Methods
    
    func calculateCastOnStitches(pattern: GlovePattern) -> Int {
        
        // Calculates the number of cast on stitches based on the gauge (available from
        // the KnittingPattern object.
        
        var castOnStitches: Int = 0
        
        if  let handSize = pattern.handSize,
            let gauge = pattern.gauge {
            
            let armConfig = pattern.armConfig
            let numStitches = (handSize.handCircumference + pattern.ease) * gauge.stitchGauge
            
            castOnStitches = KnitOnUtils.roundToInteger(amtToRound: numStitches)
            
            if let cuffStitchPattern = armConfig.cuffStitchPattern {
                castOnStitches = cuffStitchPattern.augmentStitchCount(stitchCount: castOnStitches)
            }
            else {
                castOnStitches = armConfig.armStitchPattern.augmentStitchCount(stitchCount: castOnStitches)
            }
        }
        
        return castOnStitches
    }
    
    // generateInstructions -- This method generates the instructions for the glove arm.
    // It includes the cast on, cuff, arm, and wrist shaping.
    
    func generateInstructions(context: InstructionContext) {
        
        guard let gloveContext = context as? GloveInstructionContext else {
            return
        }
        
        let glovePattern = gloveContext.glovePattern
        let armConfig: GloveArmConfig = glovePattern.armConfig
        var str: String
        var instruction: MarkupElement
        
        // Cast On
        let castOnStitches: Int = self.calculateCastOnStitches(pattern: glovePattern)
        gloveContext.numWristEndingSts = castOnStitches
        
        str = String(format: GloveStrings.Arm.castOn, castOnStitches)
        instruction = Text(text: str)
        glovePattern.addInstruction(instruction)
        
        // Cuff
        if let cuffStitchPattern = armConfig.cuffStitchPattern {
            var cuffLengthStr = armConfig.cuffLength.description
            if KnitOnUtils.isIntegerValue(value: armConfig.cuffLength) {
                cuffLengthStr = Int(armConfig.cuffLength).description
            }
            str = String(format: GloveStrings.Arm.cuff, cuffStitchPattern.name, cuffLengthStr)
            instruction = Text(text: str)
            glovePattern.addInstruction(instruction)
        }
        
        // Arm
        let armLength = armConfig.armLength.rawValue
        if armLength > armConfig.cuffLength {
            var armLengthStr = armLength.description
            if KnitOnUtils.isIntegerValue(value: armLength) {
                armLengthStr = Int(armLength).description
            }
            str = String(format: GloveStrings.Arm.arm, armConfig.armStitchPattern.name, armLengthStr)
            instruction = Text(text: str)
            glovePattern.addInstruction(instruction)
        }
    
        // Wrist Shaping
        if armConfig.isWristShaping {
            str = GloveStrings.Arm.wristShaping
            instruction = Text(text: str)
            glovePattern.addInstruction(instruction)
        }
    }
}
