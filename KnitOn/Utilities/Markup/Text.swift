//
//  Text.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

//the basic MarkupElement that contains actual, simple text.
class Text: MarkupElement {
    
    var rawText: String = ""
    
    init(text: String) {
        self.rawText = text
    }
    func setRawText(text: String) {
        rawText = text
    }
    
    func getInstructions() -> String {
        return rawText
    }
    
    func convertToSavingString() -> String {
        return rawText
    }
    
}
