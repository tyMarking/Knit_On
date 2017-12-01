//
//  RibbedStitchPatterns.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 11/29/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//
// This file includes a variety of StitchPattern subclass that define related rib patterns, including:
//      1) OneByOneRib
//
// Intentionally grouped into one file.

import Foundation

class OneByOneRib: StitchPattern {
    
    // Initialization
    override init() {
        super.init()
        self.name = "1 by 1 Rib"
        self.multipleOfNStitches = 2
    }
    
    /*
     * Methods
     */
    
    // Stitch count needs to be even
    override func augmentStitchCount(stitchCount: Int) -> Int {
        var newStitichCount = stitchCount
        if newStitichCount % 2 == 1 {
            newStitichCount += 1
        }
        return newStitichCount
    }
    
}
