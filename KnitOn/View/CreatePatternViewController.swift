//
//  CreatePatternViewController.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/11/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit

class CreatePatternViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    
    //MARK: Actions
    
    @IBAction func createPattern(_ sender: UIButton) {
        print("Create the pattern!")
    }
    
    @IBAction func createAndCustomizePattern(_ sender: UIButton) {
        print("Create the pattern, and then customize it.")
    }
}
