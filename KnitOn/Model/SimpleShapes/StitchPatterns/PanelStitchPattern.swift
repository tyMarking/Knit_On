//
//  PanelPattern.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/19/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

class PanelStitchPattern: StitchPattern {
    
    //MARK: Enums
    enum PanelAlignment {
        case Center
        case OuterEdge
        case InnerEdge
    }
    //MARK: Properties
    var numPanelStitches: Int = 0
    var offsetStitches: Int = 0
    var alignment: PanelAlignment = PanelAlignment.Center
    var backgroundStitchPattern = StockinetteStich()
    
    //MARK: Initialization
    override init() {
        super.init()
        self.type = StitchPattern.PatternType.Panel
    }
}
