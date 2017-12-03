//
//  ShapeTemplate.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 11/27/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//

import Foundation

class SimpleShapeTemplate {
    
    var gauge: Gauge
    var name: String
    
    func generateInstructions() -> String {
        return "Knit On!"
    }
    
    func getName() -> String {
        return name
    }
    
    init(gauge: Gauge, name: String = "Unamed Pattern"){
        self.gauge = gauge
        self.name = name
    }
    
    
}
