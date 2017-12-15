//
//  SimpleShapeModule.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/10/17.
//  Copyright © 2017 Knit On. All rights reserved.
//
//  This protocol represents a Simple Shape Module, such as Gloves or Socks. Modules are
//  purchased separately.

import Foundation

protocol SimpleShapeModule: NSCoding {
    var name: String {get}
    
    func createPattern(name: String) -> KnittingPattern
}
