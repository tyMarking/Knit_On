//
//  Header.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

//Level is importance, 1 is greatest, 0 is none
class Header: NSObject, MarkupElement, NSCoding {
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
    
    //MARK: Saving Methods
    //saving with core data methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(level, forKey: Keys.Level)
        aCoder.encode(text, forKey: Keys.Text)
    }
    required init?(coder aDecoder: NSCoder) {
        if let levelObj = aDecoder.decodeObject(forKey: Keys.Level) as? Int {
            level = levelObj
        }
        if let textObj = aDecoder.decodeObject(forKey: Keys.Text) as? Text {
            text = textObj
        }
    }
    
    struct Keys {
        static let Level = "level"
        static let Text = "text"
    }
}
