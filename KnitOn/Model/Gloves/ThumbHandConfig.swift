//
//  ThumbHandConfig.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 12/7/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//

import Foundation

struct ThumbHandConfig {
    
    // Possible thumb gussets
    enum ThumbGusset {
        case basicGusset
        case asymmetricGusset
    }
    
    //MARK: Properties
    var thumbGusset = ThumbGusset.basicGusset
    var handStitchPattern: StitchPattern = StockinetteStich()
}
