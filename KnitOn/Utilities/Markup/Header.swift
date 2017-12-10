//
//  Header.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

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
