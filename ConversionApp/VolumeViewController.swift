//
//  VolumeViewController.swift
//  ConversionApp
//
//  Created by Pratty A. Hongsyvilay on 9/25/20.
//  Copyright © 2020 Pratty A. Hongsyvilay. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController {

    @IBOutlet weak var fromUnit: DecimalMinusTextField!
    @IBOutlet weak var toUnit: DecimalMinusTextField!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingsSegue" {
            if let dest = segue.destination as? SettingsViewController {
                dest.unitType = "volume"
                dest.fromOld = fromLabel.text!
                dest.toOld = toLabel.text!
            }
        }
    }
    
    @IBAction func clearFields(_ sender: UIButton) {
        fromUnit.text = ""
        toUnit.text = ""
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
