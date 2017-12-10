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

//use get instructions to get text for UI
protocol MarkupElement {
    func getInstructions() -> String
    func convertToSavingString() -> String
    
}

class Title: MarkupElement {
    
    var text: Text = Text(text: "")
    init(title: String) {
        text.setRawText(text: title)
    }
    func getInstructions() -> String {
        return text.getInstructions()
    }
    func convertToSavingString() -> String {
        return ("$title$"+text.convertToSavingString()+"$/title$")
    }
}


//Level is importance, 1 is greatest, 0 is none
class Header: MarkupElement {
    var level: Int = 0
    var text: Text = Text(text: "")
    
    init(level: Int? = nil, text: String? = nil) {
        self.level = level ?? 0
        self.text.setRawText(text: text ?? "")
    }
    
    func getInstructions() -> String {
        return text.getInstructions()
    }
    
    func convertToSavingString() -> String {
        return ("$header$"+text.convertToSavingString()+"$/header$")
    }
}

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

class List: MarkupElement {
    var items: [MarkupElement] = []
    
    func addItem(item: MarkupElement) {
        items.append(item)
    }
    
    func addItems(items: [MarkupElement]) {
        for item in items {
            self.items.append(item)
        }
    }
    
    func getItems() -> [MarkupElement] {
        return items
    }
    
    func getInstructions() -> String {
        var ret = ""
        for item in items {
            ret.append(item.getInstructions())
            ret.append(" ")
        }
        ret.removeLast()
        return ret
    }
    
    
    func convertToSavingString() -> String {
        var ret = "$list$"
        for item in items {
            ret += item.convertToSavingString()
            ret += " "
        }
        ret.removeLast()
        ret += "$/list$"
        return ret

    }
    
    
}

class ActionableWrapper: MarkupElement {
    var element: MarkupElement
    var isCompleted: Bool
    init(element: MarkupElement) {
        self.element = element
        isCompleted = false
    }
    func getInstructions() -> String {
        return element.getInstructions()
    }
    
    func getCompleted() -> Bool {
        return isCompleted
    }
    
    func setCompleted(completed: Bool) {
        self.isCompleted = completed
    }
    
    func toggleCompleted() {
        isCompleted = !isCompleted
    }
    
    func convertToSavingString() -> String {
        var ret = "$checkableWrapper, checked="
        ret += String(isCompleted)
        ret += "$"
        ret += element.convertToSavingString()
        ret += "$/checkableWrapper$"
        return ret
    }
    
    
}

//the basic MarkupElement that contains actual text, contains the majority of formating
class Text: MarkupElement {
    
    var rawText: String = ""
    
    init(text: String) {
        self.rawText = text
    }
    func getInstructions() -> String {
        return rawText
    }
    
    func convertToSavingString() -> String {
        return rawText
    }
    
}

class AttributedText: MarkupElement {
    var attrString: NSAttributedString
    
    init(attrString: NSAttributedString) {
        self.attrString = attrString
    }
    
    func getInstructions() -> String {
        return attrString.string
    }
    
    func getAttributedInstructions() -> NSAttributedString {
        return attrString
    }
    
    func convertToSavingString() -> String {
        return attrString.string
        
    }
    
    
}

