//
//  GloveInstructionGenerator.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 11/27/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//
//  A glove has a variety of components that are used to generate the instructions.
//  Each component can be further customized by the user.
//  Components include:
//      1) GloveArmComponent -- generates instructions from cast on through wrist shaping
//      2) ThumbGussetComponent -- TBD: How to handle concurrent hand shaping (part of thumb gusset??
//      3) FingerComponent -- generates instructions for fingers: fingerless, tipless, or full

import Foundation

class GloveInstructionGenerator: InstructionGenerator {
    
   
    //MARK: Properties
    
    var armInstructionGenerator: GloveArmInstructionGenerator = GloveArmInstructionGenerator()
    
    //MARK: Initialization
    
    init() {
    }
    
    //MARK: Methods
    
    func generateInstructions(pattern: KnittingPattern) {
        // This method delegates instruction generation to its various components
        //      pattern will be the GlovePattern subclass of KnittingPattern.
        
        if let glovePattern = pattern as? GlovePattern {
            armInstructionGenerator.generateInstructions(pattern: glovePattern)
        }
    }
    
}
