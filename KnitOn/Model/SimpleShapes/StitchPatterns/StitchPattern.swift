//
//  StitchPattern.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 11/29/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//
//  A stitch pattern can be an "all over" pattern or can be work in a fixed stitch panel.
//      For AllOver patterns: type=PatternType.AllOver and set multipleofNStitches and plusNStitches
//      For Panel patterns: type=PatternType.Panel and set numPanelStitches
//  Currently not making these different subclasses because a stitch pattern might be used in different
//  context.

import Foundation

class StitchPattern {
    
    //MARK: Enums
    
    enum PatternType {
        case AllOver
        case Panel
    }
    
    //MARK: Properties
    
    var name: String = "Stitch Pattern"
    var isRowByRow: Bool = true
    var type: PatternType = PatternType.AllOver
    var hasChart: Bool = false
    
    //MARK: Initialization
    
    init() {
    }
    
    //MARK: Methods
    
    func augmentStitchCount(stitchCount: Int) -> Int {
        return stitchCount
    }
    
    func generateStitchPatternDescription() -> String {
        return String()
    }
    
    func generateStitchPatternInstructions() -> String {
        // Generates the stitch pattern instructions, either row by row or in the round
        return String()
    }

}
