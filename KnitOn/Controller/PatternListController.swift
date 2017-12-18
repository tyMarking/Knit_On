//
//  ViewController.swift
//  KnitOn
//
//  Created by Ty Marking on 11/25/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit

class PatternListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Actions
    
    @IBAction func unwindToPatternList(sender: UIStoryboardSegue) {
        
        // Unwinding back from the CreatePatternViewController. Before doing anything, ensure that a new pattern
        // was created.
        if let sourceViewController = sender.source as? CreatePatternViewController, sourceViewController.newPattern != nil {
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
            print("Need to delete pattern at index: " + String(indexPath.row))
            tableView.reloadData()
        }
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if (segue.identifier == "PatternFromMainSegue") {
            let toController = segue.destination as! LimpAlongPatternViewController
            toController.pattern = LimpAlongController.patterns[index]
            
            
        }*/
        
        KnitOn.saveData()
    }
    
    

    


    
    
    
    
    
    
}

