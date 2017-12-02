//
//  LimpAlongCreateNewViewController.swift
//  KnitOn
//
//  Created by Ty Marking on 12/1/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit
var gauge: Int = 0
var handMeasurements: HandMeasurements = WomanMediumHand()
class LimpAlongCreateNewViewController: UIViewController {
    
    @IBOutlet weak var gaugeOutlet: UITextField!
    
    @IBAction func gaugeSet(_ sender: UITextField) {
        gauge = Int(gaugeOutlet.text!)!
    }
    
    @IBAction func xSmall(_ sender: UIButton) {
        handMeasurements = WomanXSmallHand()
    }
    
    @IBAction func small(_ sender: UIButton) {
        handMeasurements = WomanSmallHand()
    }
    
    @IBAction func medium(_ sender: UIButton) {
        handMeasurements = WomanMediumHand()
    }
    
    @IBAction func large(_ sender: UIButton) {
        handMeasurements = WomanLargeHand()
    }
    
    @IBAction func createPattern(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
