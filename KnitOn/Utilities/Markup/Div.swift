//
//  Div.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation
class Div: NSObject, MarkupElement, NSCoding {
    var elements: Array = [MarkupElement]()
    override init() {
        super.init()
    }
    
    init(elements: [MarkupElement]) {
        self.elements = elements
    }
    
    public func addElement(element: MarkupElement) {
        elements.append(element)
    }
    
    public func addElements(elements: [MarkupElement]) {
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
    
    
    //saving with core data methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(elements, forKey: Keys.Elements)
    }
    required init?(coder aDecoder: NSCoder) {
        if let elementsObj = aDecoder.decodeObject(forKey: Keys.Elements) as? [MarkupElement] {
            elements = elementsObj
        }
    }
    
    struct Keys {
        static let Elements = "elements"
    }
}
