//
//  Markup.swift
//  KnitOn
//
//  Created by Ty Marking on 11/26/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

//add dynamic values with addVar (Used by having $name in text, \ escapes $
//get instructions (Array<MarkupElement>) by calling getInstructions()
//add elements with addInstruction or addInstructions (for an array of elements)
class Markup {
    var instructions: Array<MarkupElement>
    var vars: Dictionary<String, Any>
    
    init(instructions: [MarkupElement]? = nil, vars: Dictionary<String, Any>? = nil) {
        if instructions != nil {
            self.instructions = instructions!
        } else {
            self.instructions = []
        }
        
        if vars != nil {
            self.vars = vars!
        } else {
            self.vars = Dictionary<String, Any>()
        }
    }
    
    
    public func getInstructions() -> [MarkupElement] {
        for instruction in instructions {
            instruction.formatText(vars: vars)
        }
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
    
    public func addVar(key: String, value: Any) {
        vars[key] = value
    }
    public func getVars() -> Dictionary<String, Any> {
        //Dictionary is a Struct so no need for .copy()
        let varsCopy = vars
        return varsCopy
    }
    
}

protocol MarkupElement {
    func getInstructions() -> String
    func formatText(vars: Dictionary<String, Any>)
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
    func formatText(vars: Dictionary<String, Any>) {
        text.formatText(vars: vars)
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
    func formatText(vars: Dictionary<String, Any>) {
        text.formatText(vars: vars)
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
    
    func formatText(vars: Dictionary<String, Any>) {
        for elem in elements {
            elem.formatText(vars: vars)
        }
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


//the basic MarkupElement that contains actual text, contains the majority of formating
class Text: MarkupElement {
    
    //other atributes
    var emphasis = false
    //etc
    
    var rawText: String = ""
    var formatedText: String = ""
    init(text: String) {
        self.rawText = text
    }
    
    func formatText(vars: Dictionary<String, Any>) {
        //check if already formated??
        runFormat(vars: vars)
    }
    
    private func runFormat(vars: Dictionary<String, Any>) {
        var final: String = ""
        var i = 0
        while(i < rawText.count) {
            //there must be a simpler way?
            //maybe I'm in the wrong mindset
            //fix with recurevely deminishing the string?
            var index = rawText.index (rawText.startIndex, offsetBy: i)
            var prevIndex = rawText.index (rawText.startIndex, offsetBy: 0)
            if (i != 0) {
                prevIndex = rawText.index (rawText.startIndex, offsetBy: i-1)
            }
            
            if (rawText[index] == "$" && (i == 0 || rawText[prevIndex] != "\\")) {
                var varName = ""
                i += 1
                index = rawText.index (rawText.startIndex, offsetBy: i)
                while (i < rawText.count && rawText[index] != " ") {
                    varName.append(rawText[index])
                    i += 1
                    index = rawText.index (rawText.startIndex, offsetBy: i)
                }
                
                var varReplacement = ""
                if let value = vars[varName] {
                    varReplacement.append(String(describing: value))
                } else {
                    final.append("$\(varName)")
                }
                
                //varReplacement.append(" ")
                final.append(varReplacement)
                
            }
        }
        formatedText = final
    }
    
    
    func getInstructions() -> String {
        return formatedText
    }
    public func getRawText() -> String {
        return rawText
    }
    public func setRawText(text: String) {
        self.rawText = text
    }
    
    func convertToSavingString() -> String {
        return formatedText
    }
}

