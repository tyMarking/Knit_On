//
//  ViewController.swift
//  KnitOn
//
//  Created by Ty Marking on 11/25/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit

var theKnitter: Knitter!

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Need to reload the saved information about the knitter. For now, create some default
        theKnitter = Knitter();
        
        // Hack -- adding two modules, so I have something to test the pattern type PickerView
        theKnitter.addModule(GloveModule())
        theKnitter.addModule(GloveModule())
        
        // Create a few patterns
        var pattern: GlovePattern = GlovePattern()
        pattern.title = "Pattern 1"
        theKnitter.addPattern(pattern)
        
        pattern = GlovePattern()
        pattern.title = "Pattern 2"
        theKnitter.addPattern(pattern)
        
        tableView.dataSource = self
        //tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDelegate
    
    //MARK: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theKnitter.getPatterns().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "patternCellIdentifier")!
        
        let row = indexPath.row
        let patterns = theKnitter.getPatterns()
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
    }
    
    

    


}

