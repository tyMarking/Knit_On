//
//  Pattern.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 12/5/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//
//  The KnittingPattern class (and it's subclasses) is the top-level object for a user's knitting
//  pattern. The KnittingPattern has three primary uses:
//
//      1) Hold's pattern specific data, such as the title and description of the pattern
//         and the gauge of the pattern. Current properties include:
//              * title -- the title of the knitting pattern
//              * description -- a description of the pattern, set by the user.
//              * gauge -- an instance of the Gauge class.
//         Subclasses will define additional properties, specific to the type of pattern.
//
//      2) Manages the instructions for the pattern
//              * InstructionGenerator objects generate the instructions and use the addINstruction
//                method to add a specific PatternInstruction
//              * The instructions can be retrieved using the getInstructions method. This method
//                returns an array of PatternInstruction objects.
//
//      3) Stores configuration data, which can be customized by the user. This class does not
//         contain any configurations, but subclass will add the specifi configurations

import Foundation

class KnittingPattern {
    
    var title: String = "A Knitting Pattern"
    var description: String?
    var gauge: Gauge?
    var instructions: [PatternInstruction] = []
    
    func addInstruction(instruction: PatternInstruction) {
        self.instructions.append(instruction)
    }
    
    func getInstructions() -> [PatternInstruction]{
        return self.instructions
    }
}
