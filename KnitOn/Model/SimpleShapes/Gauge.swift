//
//  Gauge.swift
//  KnitOnCommandLineApp
//
//  Created by CAROLYN STEELE on 11/27/17.
//  Copyright © 2017 CAROLYN STEELE. All rights reserved.
//

import Foundation

struct Gauge {
    
    var stitchGauge: Float
    var rowGauge: Float? {
        get {
            return self.rowGauge ?? 4/5*self.stitchGauge
        }
        set {
            self.rowGauge = newValue
        }
    }
    
    init(stitchGauge: Float) {
        self.stitchGauge = stitchGauge
    }
    
    init(stitchGauge: Float, rowGauge: Float){
        self.stitchGauge = stitchGauge
        self.rowGauge = rowGauge
    }
    
}
