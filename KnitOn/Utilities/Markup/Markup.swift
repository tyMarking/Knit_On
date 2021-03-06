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
    
    public func getRawTextInstructions() -> String {
        var ret = ""
        for instruction in instructions {
            ret.append(instruction.getInstructions())
            ret.append("\n")
        }
        //ret.removeLast()
        return ret
    }
    
    public func getAttributedTextInstructions() -> NSAttributedString {
        let ret: NSMutableAttributedString = NSMutableAttributedString(string: "")
        for instruction in instructions {
            ret.append(instruction.getAttributedInstructions())
            ret.append(NSAttributedString(string: "\n"))
        }
        return ret
    }
    
    public func addInstructions(elements: [MarkupElement]) {
        for element in elements {
            instructions.append(element)
        }
    }
    
    //MARK: Saving Methods
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






