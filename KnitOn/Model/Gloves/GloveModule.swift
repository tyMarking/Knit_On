//
//  GloveModule.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/10/17.
//  Copyright © 2017 Knit On. All rights reserved.
//
//  This class represents the Glove Simple Shape module. 

import Foundation

class GloveModule: NSObject, SimpleShapeModule, NSCoding {
    
    //MARK: Properties
    var name: String = "Gloves"
    
    override init() {
        
    }
    //MARK: Methods
    func createPattern(name: String) -> KnittingPattern {
        let pattern = GlovePattern()
        pattern.title = name
        
        return pattern
    }
    
    //MARK: Saving Methods
    //saving with core data methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: Keys.Name)
        
    }
    required init?(coder aDecoder: NSCoder) {
        if let nameObj = aDecoder.decodeObject(forKey: Keys.Name) as? String {
            name = nameObj
        }
        
    }
    
    struct Keys {
        static let Name = "name"
        
    }
}
