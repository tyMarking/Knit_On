//
//  GloveThumbHandInstructionGenerator.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/20/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

class GloveThumbHandInstructionGenerator: InstructionGenerator {
    
    //MARK: Instruction Generator Methods
    func generateInstructions(context: InstructionContext) {
        
        guard let gloveContext = context as? GloveInstructionContext else {
            return
        }
        
        gloveContext.numThumbGussetSts = calculateNumberOfThumbStitches(gloveContext: gloveContext)
        gloveContext.lenAboveGusset = calculateLengthFromGussetToTopHand(gloveContext: gloveContext)
        
        //let glovePattern = gloveContext.glovePattern
        
    }
    
    //MARK: Methods
    
    func calculateNumberOfThumbStitches(gloveContext: GloveInstructionContext) -> Int {
        
        let pattern = gloveContext.glovePattern
        let thumbStitches = (pattern.handSize?.thumbCircumference)! * (pattern.gauge?.stitchGauge)! - 1
        var intThumbSts: Int = KnitOnUtils.roundToInteger(amtToRound: thumbStitches)
        
        if KnitOnUtils.isEven(value: intThumbSts) {
            intThumbSts += 1
        }
        
        return intThumbSts
    }
    
    func calculateNumberOfGussetIncreaseRounds(numGussetSts: Int) -> Int {
        return Int((numGussetSts - 1)/2)
    }
    
    func calculateNumberOfGussetRounds(numGussetSts: Int) -> Int {
        let numGussetSetupRounds = 2
        return self.calculateNumberOfGussetIncreaseRounds(numGussetSts: numGussetSts) * 3 + numGussetSetupRounds
    }
    
    func calculateLengthFromGussetToTopHand(gloveContext: GloveInstructionContext) -> Float {
        if gloveContext.numThumbGussetSts == 0 {
            gloveContext.numThumbGussetSts = calculateNumberOfThumbStitches(gloveContext: gloveContext)
        }
        let numGussetRounds = self.calculateNumberOfGussetRounds(numGussetSts: gloveContext.numThumbGussetSts)
        let glovePattern = gloveContext.glovePattern
        let handLengthToTopGusset = Float(numGussetRounds) / (glovePattern.gauge?.rowGauge)!
        let lengthToTopHand = KnitOnUtils.roundToQuarterInch(amtToRound: (glovePattern.handSize?.handLength)! - handLengthToTopGusset)
        
        return lengthToTopHand
    }
    
    
}
