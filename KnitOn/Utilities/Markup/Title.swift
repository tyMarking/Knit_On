//
//  Title.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

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
    
    //saving with core data methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: Keys.Text)
    }
    required init?(coder aDecoder: NSCoder) {
        if let textObj = aDecoder.decodeObject(forKey: Keys.Text) as? Text {
            text = textObj
        }
    }
    
    struct Keys {
        static let Text = "text"
    }
}
