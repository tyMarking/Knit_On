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
class Markup {
    var instructions: Array<MarkupElement>
    
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
    
}






