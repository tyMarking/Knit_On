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
    
    var armInstGen: GloveArmInstructionGenerator = GloveArmInstructionGenerator()
    var thumbHandInstGen: GloveThumbHandInstructionGenerator = GloveThumbHandInstructionGenerator()
    var fingerInstGen: GloveFingersInstructionGenerator = GloveFingersInstructionGenerator()
    
    //MARK: Initialization
    
    init() {
    }
    
    //MARK: Methods
    
    func generateInstructions(context: InstructionContext) {
        
        // This method delegates instruction generation to its various components
        // pattern will be the GlovePattern subclass of KnittingPattern.
        
        guard let gloveContext = context as? GloveInstructionContext else {
            return
        }
        
        let glovePattern = gloveContext.glovePattern
        
        if glovePattern.isRightLeftInterchangable() {
            generateInterchangeableGloveInstructions(context: gloveContext)
        }
        else {
            generateRightGloveInstructions(context: gloveContext)
            generateLeftGloveInstructions(context: gloveContext)
        }
    }
    
    func generateRightGloveInstructions(context: GloveInstructionContext) {
        armInstGen.generateInstructions(context: context)
    }
    
    func generateLeftGloveInstructions(context: GloveInstructionContext) {
        armInstGen.generateInstructions(context: context)
    }
    
    func generateInterchangeableGloveInstructions(context: GloveInstructionContext) {
        armInstGen.generateInstructions(context: context)
    }
    
}
