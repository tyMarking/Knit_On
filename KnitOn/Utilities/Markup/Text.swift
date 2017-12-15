//
//  Text.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

//the basic MarkupElement that contains actual, simple text.
class Text: NSObject, MarkupElement, NSCoding {
    
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
    
    //MARK: Saving Methods
    //saving with core data methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(rawText, forKey: Keys.RawText)
    }
    required init?(coder aDecoder: NSCoder) {
        if let rawTextObj = aDecoder.decodeObject(forKey: Keys.RawText) as? String {
            rawText = rawTextObj
        }
    }
    
    struct Keys {
        static let RawText = "rawText"
    }
}
