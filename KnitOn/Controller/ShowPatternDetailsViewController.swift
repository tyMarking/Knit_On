//
//  ShowPatternDetailsViewController.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/18/17.
//  Copyright © 2017 Knit On. All rights reserved.
//
//  This class is the view controller for the Show Pattern Details scene.
//
//  Eventually, this view will display different information based on the type of pattern it's
//  displaying. What is the best way to do this?

import UIKit

class ShowPatternDetailsViewController: UITableViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var patternNameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var toFitLabel: UILabel!
    @IBOutlet weak var gaugeLabel: UILabel!
    @IBOutlet weak var stitchesPerInchLabel: UILabel!
    @IBOutlet weak var rowsPerInchLabel: UILabel!
    
    
    var pattern: KnittingPattern?
    var isEditingEnabled = false
    
    //MARK: UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let glovePattern = self.pattern as? GlovePattern {
            patternNameLabel.text = glovePattern.title
            typeLabel.text = glovePattern.type
            toFitLabel.text = glovePattern.handSize?.name ?? "No size selected"
            gaugeLabel.text = String(describing: (glovePattern.gauge?.stitchGauge) )
            if gaugeLabel.text == "nil" {
                gaugeLabel.text = "No gauge"
            }
            stitchesPerInchLabel.text = "TODO"
            rowsPerInchLabel.text = "TODO"
            
        }
        
        // Show or hide the accesory icons and save/edit buttons based on
        // the isEditingEnabled property.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK Segue Handling
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "viewInstructions" {
            guard let instructionViewController = segue.destination as? InstructionViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            // Hack -- Only handling glove patterns right now!
            guard let glovePattern = pattern! as? GlovePattern else {
                return
            }
            let generator = GloveInstructionGenerator()
            let context = GloveInstructionContext(pattern: glovePattern)
            generator.generateInstructions(context: context)
            instructionViewController.markup = (pattern?.getInstructionsMarkup())!
        }
        

    }
    
}
