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
    
    func generateInstructions() -> String {
        return "Knit On!"
    }
    
    init(gauge: Gauge){
        self.gauge = gauge
    }
    
}
