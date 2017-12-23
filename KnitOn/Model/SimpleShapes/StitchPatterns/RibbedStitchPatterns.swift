//
//  RibbedStitchPatterns.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 11/29/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//
// This file includes a variety of StitchPattern subclass that define related rib patterns, including:
//      1) OneByOneRib
//      2) TwoByTwoRib
//
// Intentionally grouped into one file.

import Foundation

class OneByOneRib: AllOverStitchPattern {
    
    //MARK: Properties
    var isStartWithKnit: Bool = true
    
    //MARK:  Initialization
    override init() {
        super.init()
        self.name = "1 by 1 Rib"
        self.multipleOfNStitches = 2
    }
    
    //MARK: StitchPattern Methods
    
    override func augmentStitchCount(stitchCount: Int) -> Int {
        // Stitch count needs to be even
        var newStitchCount = stitchCount
        if newStitchCount % 2 == 1 {
            newStitchCount += 1
        }
        return newStitchCount
    }
    
    override func generateStitchPatternInstructions() -> String {
        // Generates the stitch pattern instructions, either row by row or in the round
        if self.isRowByRow {
            return StitchPatternStrings.OneByOneRib.rows
        }
        else {
            return StitchPatternStrings.OneByOneRib.round
        }
    }
}

class TwoByTwoRib: AllOverStitchPattern {
    
    //MARK: Properties
    var isStartWithKnit: Bool = true
    
    //MARK:  Initialization
    override init() {
        super.init()
        self.name = "2 by 2 Rib"
        self.multipleOfNStitches = 4
    }
    
    //MARK: StitchPattern Methods
    
    override func augmentStitchCount(stitchCount: Int) -> Int {
        // Stitch count needs to be even
        var newStitchCount = stitchCount
        let remainder = stitchCount % 4
        if remainder <= 2 {
            newStitchCount -= remainder
        }
        else {
            newStitchCount += (multipleOfNStitches - remainder)
        }
        return newStitchCount
    }
    
    override func generateStitchPatternInstructions() -> String {
        // Generates the stitch pattern instructions, either row by row or in the round
        if self.isRowByRow {
            return StitchPatternStrings.TwoByTwoRib.rows
        }
        else {
            return StitchPatternStrings.TwoByTwoRib.round
        }
    }
}
