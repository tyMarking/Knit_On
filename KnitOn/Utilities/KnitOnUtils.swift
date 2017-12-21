//
//  KnitOnUtils.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/20/17.
//  Copyright © 2017 Knit On. All rights reserved.
//
//  This is a utilities struct that defines only static methods.

import Foundation

struct KnitOnUtils {

    static func roundToQuarterInch(amtToRound: Float) -> Float {
        return KnitOnUtils.roundingHelper(amtToRound: amtToRound, toNearest: 0.25, fairness: 0.5)
    }
    
    static func roundToTenthCentimeter(amtToRound: Float) -> Float {
        return KnitOnUtils.roundingHelper(amtToRound: amtToRound, toNearest: 0.1, fairness: 0.5)
    }
    
    static func roundToInteger(amtToRound: Float) -> Int {
        return Int(KnitOnUtils.roundingHelper(amtToRound: amtToRound, toNearest: 1, fairness: 0.5))
    }
    
    static func roundingHelper(amtToRound: Float, toNearest: Float, fairness: Float) -> Float {
        // toNearest => .25 if round to quater, 0.1 for rounding to tenth, 1 for rounding to integer
        // fairness => btween 0 to 0.9999999___.
        //      0 means floor and 0.99999... means ceiling. But for ceiling, I would recommend, Math.Ceiling
        //      0.5 = Standard Rounding function. It will round up the border case. i.e. 1.5 to 2 and not 1.
        //      0.4999999... non-standard rounding function. Where border case is rounded down. i.e. 1.5 to 1 and not 2.
        //      0.75 means first 75% values will be rounded down, rest 25% value will be rounded up.
        return floor(amtToRound / toNearest + fairness) * toNearest
    }
}
