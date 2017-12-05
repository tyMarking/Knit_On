//
//  LimpAlongPatternViewController.swift
//  KnitOn
//
//  Created by Ty Marking on 12/5/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit

class LimpAlongPatternViewController: UIViewController {
    var pattern: SimpleShapeTemplate? = nil
    
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var gaugeOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOutlet.text = pattern?.getName()
        let gaugeFloat = pattern?.gauge.stitchGauge
        let gaugueString = String(describing: gaugeFloat!)
        gaugeOutlet.text = gaugueString
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
