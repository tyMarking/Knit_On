//
//  ShowPatternDetailsViewController.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/18/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit

class ShowPatternDetailsViewController: UITableViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var patternNameLabel: UILabel!
    
    var pattern: KnittingPattern?
    
    //MARK: UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pattern = self.pattern {
            patternNameLabel.text = pattern.title
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
