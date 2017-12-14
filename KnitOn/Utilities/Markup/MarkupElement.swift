//
//  MarkupElement.swift
//  KnitOn
//
//  Created by Ty Marking on 12/9/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation

//use get instructions to get text for UI
protocol MarkupElement {
    func getInstructions() -> String
    func convertToSavingString() -> String
    
    //saving with core data methods
    func encode(with aCoder: NSCoder)
    init?(coder aDecoder: NSCoder)

}
