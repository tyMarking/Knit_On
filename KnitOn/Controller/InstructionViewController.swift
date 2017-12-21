//
//  InstructionViewController.swift
//  KnitOn
//
//  Created by Ty Marking on 12/19/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController {
    @IBOutlet weak var instructionTextView: UITextView!
    
    var markup: Markup = Markup()
    override func viewDidLoad() {
        super.viewDidLoad()
        instructionTextView.text = markup.getRawTextInstructions()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
