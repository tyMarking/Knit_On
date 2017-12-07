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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.reloadData()
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LimpAlongController.patterns.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = LimpAlongController.patterns[indexPath.row].getName()
        
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
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

