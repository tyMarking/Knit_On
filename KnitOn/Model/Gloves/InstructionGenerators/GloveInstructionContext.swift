//
//  GloveInstructionContext.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/20/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

final class GloveInstructionContext: InstructionContext {
    
    //MARK: InstructionContext
    var pattern: KnittingPattern
    
    //MARK: Properties
    var glovePattern: GlovePattern
    
    var numWristEndingSts: Int = 0
    var numThumbGussetSts: Int = 0
    var numHandEndingSts: Int = 0
    
    var lenAboveGusset: Float = 0
    
    //MARK: Initialization
    init(pattern: GlovePattern) {
        self.pattern = pattern
        self.glovePattern = pattern
    }
}
