//
//  GloveTemplate.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 11/27/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//

import Foundation

class GloveTemplate: SimpleShapeTemplate {
   
    // Properties
    
    var handSize: HandMeasurements
    var ease: Float = 0.0
    var armComponent: GloveArmComponent = GloveArmComponent()
    
    // Initialization
    
    init(gauge: Gauge, handSize: HandMeasurements, name: String = "Unnamed pattern"){
        self.handSize = handSize
        super.init(gauge: gauge, name: name)
        self.armComponent.gloveParent = self
    }
    
    // Methods
    
    override func generateInstructions() -> String {
        return armComponent.generateInstructions()
        //where markup is called
    }
    
}
