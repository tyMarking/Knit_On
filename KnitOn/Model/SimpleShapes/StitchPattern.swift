//
//  StitchPattern.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 11/29/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//

import Foundation

class StitchPattern {
    
    /*
     * Properties
     */
    
    var multipleOfNStitches: Int = 1
    var plusNStitches: Int = 0
    var name: String = "Stitch Pattern"
    var isRowByRow: Bool = true
    
    /*
     * Initialization
     */
    
    init() {
    }
    
    /*
     * Methods
     */
    
    func augmentStitchCount(stitchCount: Int) -> Int {
        return stitchCount
    }
    
    // Description includes the name and "multiple of N stitches plus M"
    func generateStitchPatternDescription() -> String {
        var description = String()
        description += self.name + ": "
        description += "Multiple of " + String(self.multipleOfNStitches) + " stitches"
        if self.plusNStitches > 0 {
            description += " plus " + String(self.plusNStitches)
        }
        return description
    }
    
    // Generates the stitch pattern instructions, either row by row or in the round
    func generateStitchPatternInstructions() -> String {
        return String()
    }

}
