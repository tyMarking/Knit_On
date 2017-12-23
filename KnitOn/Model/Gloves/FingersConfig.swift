//
//  FingersConfig.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 12/7/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//

import Foundation

struct FingersConfig {
    
    // FingerLengthPercent: What percent of the full finger length is covered by the glove's "fingers"
    // The rawValue is the percent (as a decimal) of the full finger length (based on hand size measurement)
    enum FingerCoverage: Float {
        case short = 0.35
        case standard = 0.6
        case full = 1.0
    }
    
    //MARK: Properties
    var fingerCoverage: FingerCoverage = FingerCoverage.standard
    var isIndividualFingers: Bool = false
    var edgingLength: Float = 0.75
    var edgingStitchPattern: StitchPattern?
}
