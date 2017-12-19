//
//  GloveArmConfig.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 12/7/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//

import Foundation

struct GloveArmConfig {
    
    // ArmLength: There are 4 standard glove arm lengths. The rawValue is the actual length of the arm in inches
    enum ArmLength: Float {
        case short = 2.5
        case standard = 4
        case long = 6
        case gauntlet = 8
    }
    
    // Properties
    var armLength: ArmLength = ArmLength.standard
    var isWristShaping: Bool = true
    var cuffLength: Float = 1
    var cuffStitchPattern: StitchPattern?
    var armStitchPattern: StitchPattern = StockinetteStich()
}
