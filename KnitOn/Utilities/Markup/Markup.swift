//
//  Markup.swift
//  KnitOn
//
//  Created by Ty Marking on 11/26/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

//stored an array of instructions (MakrupElements)
//add elements with addInstruction or addInstructions (for an array of elements)
class Markup: NSObject, NSCoding {
    var instructions: [MarkupElement] = []
    
    init(instructions: [MarkupElement]? = nil) {
        if instructions != nil {
            self.instructions = instructions!
        } else {
            self.instructions = []
        }
    }
    
    
    public func getInstructions() -> [MarkupElement] {
        //nead to make coppy?
        return instructions
    }
    
    public func addInstruction(element: MarkupElement) {
        instructions.append(element)
    }
    
    public func addInstructions(elements: [MarkupElement]) {
        for element in elements {
            instructions.append(element)
        }
    }
    
    //saving with core data methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(instructions, forKey: Keys.Instructions)
    }
    required init?(coder aDecoder: NSCoder) {
        if let instructionsObj = aDecoder.decodeObject(forKey: Keys.Instructions) as? [MarkupElement] {
            instructions = instructionsObj
        }
    }
    
    struct Keys {
        static let Instructions = "instructions"
    }
    
}






