//
//  LimpAlongPatternViewController.swift
//  KnitOn
//
//  Created by Ty Marking on 12/5/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit

class LimpAlongPatternViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var pattern: SimpleShapeTemplate? = nil
    
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var gaugeOutlet: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pattern = LimpAlongController.getCurrentPattern()
                
        nameOutlet.text = pattern?.getName()
        let gaugeFloat = pattern?.gauge.stitchGauge
        let gaugueString = String(describing: gaugeFloat!)
        gaugeOutlet.text = "Gauge: " + gaugueString
        // Do any additional setup after loading the view.
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return pattern
        return LimpAlongController.getComponentNames().count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "partCell")
        cell.textLabel?.text = LimpAlongController.getComponentNames()[indexPath.row]
        
        return cell
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
