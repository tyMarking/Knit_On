//
//  PatternInstruction.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 12/5/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//
//  The PatternInstruction class holds information for a specific knitting instructions and its
//  optional sub instructions. This class currently has a single property:
//      instructions -- must be assessed using a get
//
//  I envision this object gaining additional properties as we flesh out the UI, etc. For example
//  it might include a type, such as header or text. An instruction might also be tagged as an
//  "action". Or perhaps an instruction might have additional resources such as a link to an
//  online video or resource page. 

import Foundation

class PatternInstruction {
    private var instruction: String
    var children: [PatternInstruction]?
    
    init(instruction: String) {
        self.instruction = instruction
    }
    
    func getInstruction() -> String {
        return self.instruction
    }
    
    func getSubInstructions() -> [PatternInstruction]? {
        return self.children
    }
}
