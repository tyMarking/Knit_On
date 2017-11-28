//
//  Markup.swift
//  KnitOn
//
//  Created by Ty Marking on 11/26/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit

/*
 Current Elements
 Title
 Headers
 Text
 
 vars preceded by $ knit $kcount
 vars stored as key value pairs in a dict
 \ escapes $
 
 
 */

//This is still very much a work in progress, just getting some ideas down
class Markup {
    init() {
        
    }
    
    //Passed a Pattern, gens an array of texts
    //return will be changed to better file system later
    public func genMarkup(pattern: FakePattern) -> Array<MarkupElement> {
        //read through pattern and child objects
        //creates array of tag objects
        var markup: Array = [MarkupElement]()
        if (pattern.title != "") {
            markup.append(Title(title: pattern.title))
        }
        
        let otherInfo = pattern.getInfo()
        if otherInfo != [] {
            for info in otherInfo {
                markup.append(Text(text: info))
            }
        }
        
        //subsitutes in vals
        for item in markup {
            item.formatText(vars: vars)
        }
        
        
        
        return(markup)
    }
    
    
    

    var vars = Dictionary<String, Any>()
    
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
    func getString() -> String
    func formatText(vars: Dictionary<String, Any>)
}

class Title: MarkupElement {
    
    var text: Text = Text(text: "")
    init(title: String) {
        text.setRawText(text: title)
    }
    func getString() -> String {
        return text.getString()
    }
    func formatText(vars: Dictionary<String, Any>) {
        text.formatText(vars: vars)
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
    
    func getString() -> String {
        return text.getString()
    }
    func formatText(vars: Dictionary<String, Any>) {
        text.formatText(vars: vars)
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
    
    func getString() -> String {
        var ret = ""
        for elem in elements {
            ret.append(elem.getString())
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
    
    
}

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
        var final: String = ""
        var i = 0
        while(i < rawText.count) {
            //whyyyyy swift, there must be a simpler way??.
            //maybe I'm in the wrong mindset
            //fix with recurevely deminishing the string?
            var index = rawText.index (rawText.startIndex, offsetBy: i)
            var prevIndex = rawText.index (rawText.startIndex, offsetBy: 0)
            if (i != 0) {
                prevIndex = rawText.index (rawText.startIndex, offsetBy: i-1) 
            }
            //checking for i==0 to prevent prevIndex not existing
            if (rawText[index] == "$" && (i == 0 || rawText[prevIndex] != "\\")) {
                //start val
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
                
                varReplacement.append(" ")
                final.append(varReplacement)
            } else {
                final.append(rawText[index])
            }
            i += 1
        }
        formatedText = final
    }
    
    
    func getString() -> String {
        return formatedText
    }
    public func getRawText() -> String {
        return rawText
    }
    public func setRawText(text: String) {
        self.rawText = text
    }
}

