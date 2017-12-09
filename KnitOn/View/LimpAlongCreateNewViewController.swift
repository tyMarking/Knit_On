//
//  LimpAlongCreateNewViewController.swift
//  KnitOn
//
//  Created by Ty Marking on 12/1/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit

var gauge = Gauge(stitchGauge: 0)
var gaugeFloat: Float = 0.0
var handMeasurements: HandMeasurements = WomanMediumHand()
var name = String()
class LimpAlongCreateNewViewController: UIViewController {
    
    @IBOutlet weak var gaugeSliderOutlet: UISlider!
    @IBOutlet weak var gaugeValOutlet: UILabel!
    @IBAction func gaugeSlider(_ sender: UISlider) {
        let tempGauge = sender.value
        gaugeFloat = (((tempGauge*10).rounded())/10)
        gaugeValOutlet.text = String(gaugeFloat)
    }
    
    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBAction func nameSet(_ sender: UITextField) {
        name = nameOutlet.text!
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
        gauge = Gauge(stitchGauge: gaugeFloat)
        name = nameOutlet.text!
        //let pattern = GlovePattern(gauge: gauge, handSize: handMeasurements, name: name)
        //LimpAlongController.addPattern(pattern: pattern)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        name = ""
        gauge = Gauge(stitchGauge: 0)
        handMeasurements = WomanMediumHand()
        // Do any additional setup after loading the view.
        gaugeValOutlet.text = "10.0"
        gaugeFloat = 10.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    

}
