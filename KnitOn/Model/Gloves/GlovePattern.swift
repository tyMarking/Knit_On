//
//  GlovePattern.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 12/7/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//
//  GlovePattern is a subclass of KnittingPattern.
//  In addition to the properties it inherits from KnittingPattern. This class also defines
//  the following properties:
//      handSize -- defines the to fit size for the gloves. An instance of HandMeasurements
//      ease -- how much ease the gloves will have. Defaults to 0 ease.
//
//  Along with 3 configuration structs. The configuration structs are used to hold customization
//  data. This data is set by the user, and then used by the instruction generators when
//  generating instructions.
//      armConfig -- to customize the arm of the glove; from the cuff to the wrist
//      thumbHandConfig -- to customize the thumb gusset, the thumb, and the hand of the glove
//      fingersConfig -- to customize the glove's fingers (or lack there of!)
//

import Foundation

class GlovePattern: KnittingPattern {
    
    // Size and Fit Properties
    var handSize: HandMeasurements?
    var ease: Float = 0.0
    
    // Configuration Properties
    var armConfig: GloveArmConfig = GloveArmConfig()
    var thumbHandConfig: ThumbHandConfig = ThumbHandConfig()
    var fingersConfig: FingersConfig = FingersConfig()
    
    // Initizlier
    override init() {
        super.init()
        self.title = "Your Customized Glove Pattern"
    }
    
    
    //MARK: Saving Methods
    //saving with core data methods
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(handSize, forKey: Keys.HandSize)
        aCoder.encode(ease, forKey: Keys.Ease)

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if let handSizeObj = aDecoder.decodeObject(forKey: Keys.HandSize) as? HandMeasurements {
            handSize = handSizeObj
        }
        if let easeObj = aDecoder.decodeObject(forKey: Keys.Ease) as? Float {
            ease = easeObj
        }

    }
    
    struct Keys {
        static let HandSize = "handSize"
        static let Ease = "ease"
        
    }
}
