//
//  Knitter.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/10/17.
//  Copyright © 2017 Knit On. All rights reserved.
//
//
//  This class models the "user", who we'll call the "Knitter". Properties of a
//  Knitter include:
//      1) A list of her patterns
//      2) A collection of the Simple Shape modules she has access to
//

import Foundation

class Knitter: NSObject, NSCoding{
 
    //MARK: Properties
    private var patterns: [KnittingPattern] = []
    private var availableModules: [SimpleShapeModule] = []
    
    override init() {
       super.init()
    }
    //MARK: Methods
    
    func addPattern(_ pattern: KnittingPattern) {
        self.patterns.append(pattern)
    }
    
    func getPatterns() -> [KnittingPattern] {
        return self.patterns
    }
    
    func removePattern(at: Int) {
        if at >= 0 && at < patterns.count {
            self.patterns.remove(at: at)
        }
    }
    
    func addModule(_ module: SimpleShapeModule) {
        self.availableModules.append(module)
    }
    
    func getModules() -> [SimpleShapeModule] {
        return self.availableModules
    }
    
    
    
    //saving with core data methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(patterns, forKey: Keys.Patterns)
        aCoder.encode(availableModules, forKey: Keys.Modules)
    }
    required init?(coder aDecoder: NSCoder) {
        if let patternsObj = aDecoder.decodeObject(forKey: Keys.Patterns) as? [KnittingPattern] {
            patterns = patternsObj
        }
        if let ModulesObj = aDecoder.decodeObject(forKey: Keys.Modules) as? [SimpleShapeModule] {
            availableModules = ModulesObj
        }
    }
    
    struct Keys {
        static let Patterns = "patterns"
        static let Modules = "modules"
    }
}
