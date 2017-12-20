//
//  CableStitchPatterns.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/19/17.
//  Copyright © 2017 Knit On. All rights reserved.
//
// This file includes a variety of StitchPattern subclass that define related cable patterns, including:
//      1) ThreeOverThreeDoubleCable
//
// Intentionally grouped into one file.

import Foundation

class ThreeOverThreeDoubleCable: PanelStitchPattern {
    
    //MARK: Initialization
    override init() {
        super.init()
        self.name = "3 over 3 Double Cable"
        self.type = StitchPattern.PatternType.Panel
        self.numPanelStitches = 16
    }
    
    //MARK: StitchPattern Methods
    
    override func generateStitchPatternInstructions() -> String {
        // Generates the stitch pattern instructions, either row by row or in the round
        if self.isRowByRow {
            return StitchPatternStrings.ThreeOverThreeDoubleCable.rows
        }
        else {
            return StitchPatternStrings.ThreeOverThreeDoubleCable.round
        }
    }
    
}
