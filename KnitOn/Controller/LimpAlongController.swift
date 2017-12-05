//
//  LimpAlongController.swift
//  KnitOn
//
//  Created by Ty Marking on 12/2/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

var patterns: [SimpleShapeTemplate] = []
class LimpAlongController {
    
    
    public static func addPattern(pattern: SimpleShapeTemplate) {
        patterns.append(pattern)
        print("ADDED PATTERN")
    }
}

