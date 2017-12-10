//
//  Div.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation
class Div: MarkupElement {
    var elements: Array = [MarkupElement]()
    init() {
        
    }
    
    init(elements: [MarkupElement]) {
        self.elements = elements
    }
    
    public func addElement(element: MarkupElement) {
        elements.append(element)
    }
    
    public func addElementa(elements: [MarkupElement]) {
        for element in elements {
            self.elements.append(element)
        }
    }
    
    public func getElements() -> Array<MarkupElement> {
        return self.elements
    }
    
    func getInstructions() -> String {
        var ret = ""
        for elem in elements {
            ret.append(elem.getInstructions())
            ret.append(" ")
        }
        ret.removeLast()
        return ret
    }
    
    func convertToSavingString() -> String {
        var ret = "$div$"
        for elem in elements {
            ret += elem.convertToSavingString()
            ret += " "
        }
        ret += "$/div$"
        return ret
    }
}
