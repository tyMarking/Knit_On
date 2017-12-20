//
//  Controller.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//
//  This is a static class that stores any global variables used by the
//  view controllers to coordinate between the view and the model.
//
//  Was deciding between a class with all static variables/methods and a singleton class
//  Opted for the static implementation.

import Foundation

final class KnitOn {
    
    //MARK:  Properties
    static var theKnitter: Knitter = Knitter()
    static var isKnitterDataLoaded = false
    
    //MARK: Model Related Methods
    
    static func addPattern(patternName: String, patternModule: SimpleShapeModule) -> KnittingPattern? {
        var newPattern: KnittingPattern?
        if !patternName.isEmpty {
            newPattern = patternModule.createPattern(name: patternName)
            KnitOn.theKnitter.addPattern(newPattern!)
        }
        return newPattern
    }
    
    //MARK: Data Saving Methods
    private static var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("Data").path
    }
    
    static func saveData() {
        NSKeyedArchiver.archiveRootObject(KnitOn.theKnitter, toFile: KnitOn.filePath)
    }
    
    static func loadData() {
        // Attempts to load a saved Knitter. If successfull, overwrites the default empty Knitter object
        if let inData = NSKeyedUnarchiver.unarchiveObject(withFile: KnitOn.filePath) as? Knitter {
            KnitOn.theKnitter = inData
        }
        KnitOn.isKnitterDataLoaded = true
    }
    
    //MARK: Dummy Data Methods
    static func populateWithTestData() {
        
        // Temporary Method to use until saving/loading up and running
        
        // Hack -- adding two modules, so I have something to test the pattern type PickerView
        KnitOn.theKnitter.addModule(GloveModule())
        KnitOn.theKnitter.addModule(GloveModule())
        
        // Create a few patterns
        var pattern: GlovePattern = GlovePattern()
        pattern.title = "Pattern 1"
        KnitOn.theKnitter.addPattern(pattern)
        
        pattern = GlovePattern()
        pattern.title = "Pattern 2"
        KnitOn.theKnitter.addPattern(pattern)
        
        pattern = GlovePattern()
        pattern.title = "Brooke's Christmas Gloves"
        pattern.patternDescription = "Brooke’s Christmas present 2017, to match a cabled hat I made her. Yarn: The Fibre Co’s Acadia in the Mountain Ash colorway. Needles: US 6"
        pattern.gauge = Gauge(stitchGauge: 5.5)
    }

}
