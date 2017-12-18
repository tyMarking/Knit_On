//
//  CreatePatternViewController.swift
//  KnitOn
//
//  Created by CAROLYN STEELE on 12/11/17.
//  Copyright © 2017 Knit On. All rights reserved.
//

import UIKit

class CreatePatternViewController: UIViewController,
                                   UITextFieldDelegate,
                                   UIPickerViewDataSource, UIPickerViewDelegate  {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var patternTypePicker: UIPickerView!
    @IBOutlet weak var createPatternButton: UIButton!
    @IBOutlet weak var customizePatternButton: UIButton!
    @IBOutlet weak var patternTypeLabel: UILabel!
    
    var patternModule: SimpleShapeModule?
    
    //MARK: Methods
    
    private func enableButtonsIfAppropriate() {
        
        var isReadyToCreate = false
        
        if patternModule != nil, let patternName = nameTextField.text{
            isReadyToCreate = !patternName.isEmpty
        }
    
        createPatternButton.isEnabled = isReadyToCreate
        customizePatternButton.isEnabled = isReadyToCreate
    }
    
    private func createPattern() {
        if let module = self.patternModule, let patternName = nameTextField.text, !patternName.isEmpty {
            KnitOn.addPattern(patternName: patternName, patternModule: module)
        }
    }
    
    //MARK: Actions
    
    @IBAction func createPattern(_ sender: UIButton) {
        createPattern()
    }
    
    @IBAction func createAndCustomizePattern(_ sender: UIButton) {
        createPattern()
    }
    
    @IBAction func labelTapGestureRecognizer (gestureReconizer: UITapGestureRecognizer) {
        patternTypePicker.isHidden = false
    }
    
    //MARK: UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        
        self.enableButtonsIfAppropriate()
        
        patternTypePicker.delegate = self
        patternTypePicker.dataSource = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(labelTapGestureRecognizer(gestureReconizer:)))
        patternTypeLabel.addGestureRecognizer(tap)
        patternTypeLabel.isUserInteractionEnabled = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        patternTypePicker.isHidden = true
        super.touchesBegan(touches, with: event)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Make sure the picker is hidden, before text editting begins
        patternTypePicker.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        enableButtonsIfAppropriate()
    }
    
    //MARK: UIPickerViewDataSource Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let availableModules = KnitOn.theKnitter.getModules()
        return availableModules.count
    }
    
    //MARK: UIPickerViewDelegate Methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is called when the user selects a row in a component
        
        let availableModules = KnitOn.theKnitter.getModules()
        let selectedModule = availableModules[row]
        
        patternTypeLabel.text = selectedModule.name
        patternModule = selectedModule
        
        enableButtonsIfAppropriate()
        
        patternTypePicker.isHidden = true
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let availableModules = KnitOn.theKnitter.getModules()
        var title = ""
        if row < availableModules.count {
            title = availableModules[row].name
        }
        return title
    }
}
