//
//  GloveModule.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/10/17.
//  Copyright © 2017 Knit On. All rights reserved.
//
//  This class represents the Glove Simple Shape module. 

import Foundation

class GloveModule: SimpleShapeModule {
    
    //MARK: Properties
    var name: String = "Gloves"
    
    //MARK: Methods
    func createPattern(name: String) -> KnittingPattern {
        let pattern = GlovePattern()
        pattern.title = name
        
        return pattern
    }
    
    
}
