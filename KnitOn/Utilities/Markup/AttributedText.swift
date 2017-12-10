//
//  AttributedText.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

//basic MarkupElement that contains texts and attributed
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
