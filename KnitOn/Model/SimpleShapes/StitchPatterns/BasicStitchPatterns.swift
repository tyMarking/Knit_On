//
//  BasicStitchPatterns.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 11/29/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//
// This file includes a variety of StitchPattern subclass that define basic stitch patterns. Including:
//      1) StockinetteStich
// Intentionally grouped into one file.

import Foundation

class StockinetteStich: AllOverStitchPattern {
    
    // Initialization
    override init() {
        super.init()
        self.name = "Stockinette Stitch"
    }
}

