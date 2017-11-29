//
//  FakeController.swift
//  KnitOn
//
//  Inteanded to simulate jobs done by a controller needed for testing the Markup class
//
//  Created by Ty Marking on 11/26/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import Foundation
import UIKit

class FakeController: NSObject {
    
    public func test() {
        let markup = Markup()
        let pat = FakePattern()
        markup.addVar(key: "life", value: 42)
        markup.addVar(key: "Life", value: "Once More")
        for text in markup.genMarkup(pattern: pat) {
            print(text.getContent())
        }
        
        print("String test")
        print(markup.genStringMarkup(pattern: pat))
    }
}

class FakePattern {
    let title = "A Test Pattern with $life stiches"
    
    public func getInfo() -> [String] {
        return ["Stich 1 is $life","Now p $Life and other stuff"]
    }
}


