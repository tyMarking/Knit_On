//
//  Controller.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

class Controller {
    static var patterns: [KnittingPattern] = []
    static var currentPattern: KnittingPattern? = nil
    static var currentPatternIndex: Int? = nil
    static var markup: Markup? = nil
    
    
    //paterns methods
    
    public static func addPattern(pattern: KnittingPattern) {
        self.patterns.append(pattern)
    }
    
    public static func selectPattern(index: Int) {
        currentPatternIndex = index
        currentPattern = patterns[currentPatternIndex!]
    }
    
    //is this needed?
    public static func getCurrentPattern() -> KnittingPattern? {
        return currentPattern
    }
    
    public static func removePattern(at: Int) {
        if at >= 0 && at < patterns.count {
            patterns.remove(at: at)
        }
    }
    
    //accesors for UI
    public static func getMarkup() -> [PatternInstruction] {
        if currentPattern != nil {
            return currentPattern!.getInstructions()
        } else {
            return []
        }
    }
    
    //should be optional or return empty?
    public static func getCurrentPatternTitle() -> String? {
        return currentPattern?.title
    }
    public static func getCurrentPatternDescription() -> String? {
        return currentPattern?.description
    }

}
