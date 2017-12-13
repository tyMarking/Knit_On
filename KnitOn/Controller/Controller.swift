//
//  Controller.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

class Controller {
    
    //MARK:  Properties
    static var knitter: Knitter? = nil
    static var currentPattern: KnittingPattern? = nil
    static var currentPatternIndex: Int? = nil
    static var markup: Markup? = nil
    
    
    //MARK: Methods
    public static func initKinitter() {
        knitter = Knitter()
    }
    
    public static func addPattern(pattern: KnittingPattern) {
        self.knitter?.addPattern(pattern)
    }
    
    public static func selectPattern(index: Int) {
        currentPatternIndex = index
        currentPattern = self.knitter?.getPatterns()[currentPatternIndex!]
    }
    
    //is this needed?
    public static func getCurrentPattern() -> KnittingPattern? {
        return currentPattern
    }
    
    public static func removePattern(at: Int) {
        self.knitter?.removePattern(at: at)
    }
    
    //accesors for UI
    //should be optional or return empty?
    public static func getMarkup() -> [MarkupElement]? {
        if currentPattern != nil {
            return currentPattern!.getInstructions()
        } else {
            return nil
        }
    }
    
    public static func getCurrentPatternTitle() -> String? {
        return currentPattern?.title
    }
    
    public static func getCurrentPatternDescription() -> String? {
        return currentPattern?.description
    }

}
