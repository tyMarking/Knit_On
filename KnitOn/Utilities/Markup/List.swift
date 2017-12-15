//
//  List.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

class List: NSObject, MarkupElement, NSCoding {
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
    
    //MARK: Saving Methods
    //saving with core data methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(items, forKey: Keys.Items)
    }
    required init?(coder aDecoder: NSCoder) {
        if let itemsObj = aDecoder.decodeObject(forKey: Keys.Items) as? [MarkupElement] {
            items = itemsObj
        }
    }
    
    struct Keys {
        static let Items = "items"
    }
}
