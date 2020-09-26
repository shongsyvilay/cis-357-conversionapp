//
//  SettingsViewController.swift
//  ConversionApp
//
//  Created by Pratty A. Hongsyvilay on 9/25/20.
//  Copyright © 2020 Pratty A. Hongsyvilay. All rights reserved.
//

import UIKit
protocol UnitSelectionViewControllerDelegate {
    func settingsChanged(fromUnit: String, toUnits: String)
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var toUnit: UILabel!
    @IBOutlet weak var fromUnit: UILabel!
    var pickerData: [String] = [String]()
    var selection: String = ""
    var delegate : UnitSelectionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var pickerRect = picker.frame
        pickerRect.origin.x = 0
        pickerRect.origin.y = 525
        picker.frame = pickerRect
        pickerData = ["Yards", "Meters", "Miles"]
        picker.dataSource = self
        picker.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(showPicker(_:)))
        fromUnit.addGestureRecognizer(tap)
        toUnit.addGestureRecognizer(tap)
    }
    
    @objc func showPicker(_ sender: UITapGestureRecognizer) {
        print("showing")
        picker.isHidden = false
    }
}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selection = self.pickerData[row]
    }
    
}

