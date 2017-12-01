//
//  GloveArmComponent.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 11/28/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//
//  Configurable Properties for a glove's "arm" section: from cast on to top of wrist
//      1) armLength -- enum: short, standard, long, or gauntlet (default: standard)
//      2) isWristShaping -- true or false (default: true)
//      3) cuffLength -- Float (default: 1 inch)
//      4) cuffStitchPattern -- subclass of StitchPattern; no default
//      5) armStitchPattern -- subclass of StitchPattern; defaults to StockinetteStitch
//
//  Open Questions
//      * Using enums with rawValue to represent different GloveArmLengths. Better way?

import Foundation

class GloveArmComponent: SimpleShapeComponent {
    var stitchPattern: StitchPattern?
    
    
    /*
     * Enums
     */
    
    // GloveArmLength: There are 4 standard glove arm lengths. The rawValue is the actual length of the arm in inches
    enum GloveArmLength: Float {
        case short = 2
        case standard = 4
        case long = 6
        case gauntlet = 8
    }
    
    /*
     * Properties
     */
    
    var gloveParent: GloveTemplate?
    var armLength: GloveArmLength = GloveArmLength.standard
    var isWristShaping: Bool = true
    var cuffLength: Float = 1
    var cuffStitchPattern: StitchPattern?
    var armStitchPattern: StitchPattern = StockinetteStich()
    
    
    /*
     * Computed Properties
     */
    
    var castOnStitches: Int {
        var castOnStitches: Int = 0
        if let gloveParent = self.gloveParent {
            let numStitches = (gloveParent.handSize.handCircumference + gloveParent.ease) * gloveParent.gauge.stitchGauge
            castOnStitches = Int(round(numStitches))
            
            if let cuffStitchPattern = self.cuffStitchPattern {
                castOnStitches = cuffStitchPattern.augmentStitchCount(stitchCount: castOnStitches)
            }
        }
        
        return castOnStitches
    }
    
    /*
     * Methods
     */
    
    func generateInstructions() -> String {
        let castOnStitches: Int = self.castOnStitches
        var instructions = String()
        
        // Cast On
        instructions += "Cast On \(castOnStitches) stitches and join in the round.\r"
        
        // Cuff
        if let cuffStitchPattern = self.cuffStitchPattern {
            instructions += "Work in \(cuffStitchPattern.name)"
            instructions += " until cuff measures \(self.cuffLength) inch."
            instructions += "\r"
        }
        
        // Arm 
        if self.armLength.rawValue > self.cuffLength {
            instructions += "Work in \(self.armStitchPattern.name)"
            instructions += " until arm measures \(self.armLength.rawValue) inches."
            instructions += "\r"
        }
        
        // Wrist Shaping
        if self.isWristShaping {
            instructions += "At the same time, shape the wrist as follows..."
            instructions += "\r"
        }
        
        return instructions
    }
}
