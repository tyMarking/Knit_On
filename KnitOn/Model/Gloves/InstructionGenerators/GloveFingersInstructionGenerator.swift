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
    
    
}
