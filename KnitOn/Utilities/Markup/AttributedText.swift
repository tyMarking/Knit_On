//
//  AttributedText.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

//basic MarkupElement that contains attributed text
class AttributedText: Text {
    
    
    var defaultAttrString: NSAttributedString?
    
    init(attrString: NSAttributedString) {
        super.init(text: attrString.string)
        self.defaultAttrString = attrString
    }
    
    override func getInstructions() -> String {
        return defaultAttrString!.string
    }
    
    func getDefaultAttributedInstructions() -> NSAttributedString {
        return defaultAttrString!
    }
    override func getAttributedInstructions() -> NSAttributedString {
        return defaultAttrString!
    }
    
    /*func getAttributes() -> [NSAttributedStringKey: Any] {
        return defaultAttrString.attributes()
    }*/
    
    override func convertToSavingString() -> String {
        return defaultAttrString!.string
    }
    
    //MARK: Saving Methods
    //saving with core data methods
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(defaultAttrString, forKey: Keys.DefaultAttrString)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if let defaultAttrStringObj = aDecoder.decodeObject(forKey: Keys.DefaultAttrString) as? NSAttributedString {
            defaultAttrString = defaultAttrStringObj
        }
    }
    
    struct Keys {
        static let DefaultAttrString = "defaultAttrString"
    }
}
