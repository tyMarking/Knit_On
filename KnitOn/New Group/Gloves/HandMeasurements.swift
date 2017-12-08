//
//  HandMeasurements.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 11/28/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//
// This file include the definition for the HandMeasurements Protocol
// and then defines several structs for different sized hands:
//      WomanXSmallHand
//      WomanSmallHand
//      WomanMediumHand
//      WomanLargeHand
// All sizes are set with default measurements, but set is allowed so users
// can customize for a specific hand.

import Foundation

// Protocol for all Hand Measurement Sizes
//      handLength -- base of hand base of middle finger
//      handAndFingerLength -- base of hand to tip of middle finger
//
protocol HandMeasurements {
    var handCircumference: Float { get set}
    var wristCircumference: Float { get set }
    var handLength: Float { get set }
    var handAndFingerLength: Float { get set }
}

// The next four structs define four Women's hand sizes: XSmall, Small, Medium, Large

struct WomanXSmallHand: HandMeasurements {
    var handCircumference: Float = 6.75
    var wristCircumference: Float = 5.0
    var handLength: Float = 3.25
    var handAndFingerLength: Float = 6.6
}

struct WomanSmallHand: HandMeasurements {
    var handCircumference: Float = 7.0
    var wristCircumference: Float = 6.0
    var handLength: Float = 3.5
    var handAndFingerLength: Float = 6.8
}

struct WomanMediumHand: HandMeasurements {
    var handCircumference: Float = 7.25
    var wristCircumference: Float = 6.5
    var handLength: Float = 3.75
    var handAndFingerLength: Float = 7.1
}

struct WomanLargeHand: HandMeasurements {
    var handCircumference: Float = 7.5
    var wristCircumference: Float = 7.0
    var handLength: Float = 4.0
    var handAndFingerLength: Float = 7.3
}
