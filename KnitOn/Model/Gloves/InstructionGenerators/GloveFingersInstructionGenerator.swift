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
    func generateInstructions(pattern: KnittingPattern) {
        guard let glovePattern = pattern as? GlovePattern else {
            return
        }
    }
    
    
}
