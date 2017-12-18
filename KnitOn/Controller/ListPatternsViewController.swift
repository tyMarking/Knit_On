//
//  ViewController.swift
//  KnitOn
//
//  Created by Ty Marking on 11/25/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit

class ListPatternsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Navigation
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Is there a way to change the view in the destination programmatically?
        // For example, I want to show different pattern details based on the type of pattern
        // Should it be done here? Or in the ShowPatternDetailsViewController class?
        if segue.identifier == "ShowPatternDetail" {
            guard let showPatternDetailsViewController = segue.destination as? ShowPatternDetailsViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedCell = sender as? UITableViewCell else {
                fatalError("Unexpected sender")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            showPatternDetailsViewController.pattern = KnitOn.theKnitter.getPatterns()[indexPath.row]
        }
    }
    
    //MARK: Actions
    
    @IBAction func unwindToPatternList(sender: UIStoryboardSegue) {
        
        // Unwinding back from the CreatePatternViewController. Before doing anything, ensure that a new pattern
        // was created.
        if let sourceViewController = sender.source as? AddPatternViewController, sourceViewController.newPattern != nil {
            let patternCount = KnitOn.theKnitter.getPatterns().count
            if patternCount > 0 {
                let newIndexPath = IndexPath(row: patternCount-1, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            else {
                tableView.reloadData()
            }
            KnitOn.saveData()
        }
    }
    
    //MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDelegate
    
    //MARK: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return KnitOn.theKnitter.getPatterns().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "patternCellIdentifier")!
        
        let row = indexPath.row
        let patterns = KnitOn.theKnitter.getPatterns()
        cell.textLabel?.text = patterns[row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        print("Pattern selected at index: " + String(index))
        //LimpAlongController.setCurrentPatternIndex(index: index)
        //performSegue(withIdentifier: "PatternFromMainSegue", sender: self)
        //pattern is patterns[index]
    }
    
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            // Commit the deletion of a pattern
            
            tableView.beginUpdates()
            
            // Update the model: Delete the selected pattern from theKnitter's list of patterns
            KnitOn.theKnitter.removePatternAtIndex(at: indexPath.row)
            KnitOn.saveData()
            
            // Update the view: Delete the selecte row from the table view
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            tableView.endUpdates()
        }
    }
    
    
    
    
    

    


    
    
    
    
    
    
}

