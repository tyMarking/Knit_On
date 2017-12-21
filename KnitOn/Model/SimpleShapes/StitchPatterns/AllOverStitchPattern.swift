//
//  AllOverStitchPattern.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/19/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

class AllOverStitchPattern: StitchPattern {
    
    //MARK: Properties
    var multipleOfNStitches: Int = 1
    var plusNStitches: Int = 0
    
    //MARK: Initialization
    override init() {
        super.init()
        self.type = StitchPattern.PatternType.AllOver
    }
    
    //MARK: StitchPattern Methods
    override func generateStitchPatternDescription() -> String {
        // Description includes the name and "multiple of N stitches plus M"
        var description = String()
        description += self.name + ": "
        description += "Multiple of " + String(self.multipleOfNStitches) + " stitches"
        if self.plusNStitches > 0 {
            description += " plus " + String(self.plusNStitches)
        }
        return description
    }
}
