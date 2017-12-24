//
//  GloveFingersInstructionGenerator.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/20/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

class GloveFingersInstructionGenerator: InstructionGenerator {
    
    //MARK: InstructionGenerator Methods
    func generateInstructions(context: InstructionContext) {
        
        guard let gloveContext = context as? GloveInstructionContext else {
            return
        }
    }
    
    //MARK: Methods
    
    func calculateFingerLength(gloveContext: GloveInstructionContext) -> Float {
        
        let glovePattern = gloveContext.glovePattern
        
        guard let size = glovePattern.handSize else {
            return 0
        }
        
        let fingerConfig = glovePattern.fingersConfig
        let fullFingerLength = size.handAndFingerLength - size.handLength
        let coveredFingerLength = fullFingerLength * fingerConfig.fingerCoverage.rawValue
        
        return KnitOnUtils.roundToQuarterInch(amtToRound: coveredFingerLength)
    }
    
    func calculateFingerLengthFromGusset(gloveContext: GloveInstructionContext) -> Float {
        let fingerLength = calculateFingerLength(gloveContext: gloveContext)
        
        return gloveContext.lenAboveGusset + fingerLength
    }
    
    
}
