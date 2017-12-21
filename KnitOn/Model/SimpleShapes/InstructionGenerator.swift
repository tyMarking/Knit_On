//
//  InstructionGenerator.swift
//  
//
//  Created by CAROLYN STEELE on 12/5/17.
//
// To do: Want to pass around a context object instead of just the knitting pattern. This context
// object will allow the different instruction generators to set state information to pass around
// to each other. 

import Foundation

protocol InstructionGenerator {
    func generateInstructions(pattern: KnittingPattern)
}

