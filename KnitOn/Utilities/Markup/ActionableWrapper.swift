//
//  ActionableWrapper.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

class ActionableWrapper: MarkupElement {
    var element: MarkupElement
    var isCompleted: Bool
    init(element: MarkupElement) {
        self.element = element
        isCompleted = false
    }
    func getInstructions() -> String {
        return element.getInstructions()
    }
    
    func getCompleted() -> Bool {
        return isCompleted
    }
    
    func setCompleted(completed: Bool) {
        self.isCompleted = completed
    }
    
    func toggleCompleted() {
        isCompleted = !isCompleted
    }
    
    func convertToSavingString() -> String {
        var ret = "$checkableWrapper, checked="
        ret += String(isCompleted)
        ret += "$"
        ret += element.convertToSavingString()
        ret += "$/checkableWrapper$"
        return ret
    }
    
    
}
