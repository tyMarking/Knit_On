//
//  InstructionContext.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/22/17.
//  Copyright © 2017 Knit On. All rights reserved.
//
//  The InstructionContext is used by the InstructionGenerators. It is passed into the
//  generateInstructions method. This protocol includes context properties that can be
//  shared between intruction generators. 

import Foundation

protocol InstructionContext {
    var pattern: KnittingPattern { get set }
}
