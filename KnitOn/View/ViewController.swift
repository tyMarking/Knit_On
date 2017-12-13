//
//  ViewController.swift
//  KnitOn
//
//  Created by Ty Marking on 11/25/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var launched = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //checking to see if data needs to be loaded
        if (launched == false) {
            //first launch
            print("Loading data")
            loadData()
            launched = true
        }
        
        
        let glove = GlovePattern()
        
        let gloveGenerator = GloveInstructionGenerator()
        gloveGenerator.generateInstructions(pattern: glove)
        print("HI")
        let instructions = glove.getInstructions()
        for instrution in instructions {
            print(instrution.getInstructions())
        }
        
        ViewController.saveData()
        tableView.reloadData()
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LimpAlongController.patterns.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Test" //LimpAlongController.patterns[indexPath.row].getName()
        
        return cell
    }
    var index = 0
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        LimpAlongController.setCurrentPatternIndex(index: index)
        performSegue(withIdentifier: "PatternFromMainSegue", sender: self)
        //pattern is patterns[index]
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            LimpAlongController.removePattern(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if (segue.identifier == "PatternFromMainSegue") {
            let toController = segue.destination as! LimpAlongPatternViewController
            toController.pattern = LimpAlongController.patterns[index]
            
            
        }*/
        ViewController.saveData()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    //saving methods
    class var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("KnitterData").path
    }
    
    class func saveData() {
        NSKeyedArchiver.archiveRootObject(Controller.knitter, toFile: filePath)
    }
    
    private func loadData() {
        if let inData = NSKeyedUnarchiver.unarchiveObject(withFile: ViewController.filePath) as? Knitter {
            Controller.knitter = inData
        }
    }
}

