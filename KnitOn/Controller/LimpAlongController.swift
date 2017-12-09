//
//  LimpAlongController.swift
//  KnitOn
//
//  Created by Ty Marking on 12/2/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

class LimpAlongController {
    static var patterns: [KnittingPattern] = []
    static var currentPatternIndex: Int = 0
    public static func addPattern(pattern: KnittingPattern) {
        self.patterns.append(pattern)
    }
    
    public static func setCurrentPatternIndex(index: Int) {
        currentPatternIndex = index
    }
    
    public static func getCurrentPattern() -> KnittingPattern {
        return patterns[currentPatternIndex]
    }
    
    public static func removePattern(at: Int) {
        if at >= 0 && at < patterns.count {
            patterns.remove(at: at)
        }
    }
    
    public static func getComponentNames() -> [String] {
        var ret: [String] = []
        /*for component in patterns[currentPatternIndex].getComponentsList() {
            ret.append(String(describing: type(of: component)))
        }*/
        return ret
    }
    
    public static func getInstructions() -> [String] {
        return [] //patterns[currentPatternIndex].generateInstructions()
    }
}

