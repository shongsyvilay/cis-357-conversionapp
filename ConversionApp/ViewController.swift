//
//  ViewController.swift
//  ConversionApp
//
//  Created by Pratty A. Hongsyvilay on 9/25/20.
//  Copyright © 2020 Pratty A. Hongsyvilay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UnitSelectionViewControllerDelegate {

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
                dest.unitType = "length"
                dest.fromOld = fromLabel.text!
                dest.toOld = toLabel.text!
                dest.delegate = self
            }
        }
    }
    
    @IBAction func clearOther(_ sender: DecimalMinusTextField) {
        if sender.tag == 0{
            toUnit.text = ""
        }
        else {
            fromUnit.text = ""
        }
    }
    
    @IBAction func clearFields(_ sender: UIButton) {
        fromUnit.text = ""
        toUnit.text = ""
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func settingsChanged(fromUnit: String, toUnits: String) {
        fromLabel.text = fromUnit
        toLabel.text = toUnits
    }
    
    @IBAction func calculateConversion(_ sender: Any) {
        if let from: Double = Double(fromUnit.text!) {
            let to: String = toLabel.text!
            if fromLabel.text == "Meters" {
                if to == "Yards" {
                    toUnit.text = String(from * 1.0936)
                }
                if to == "Meters" {
                    toUnit.text = fromUnit.text
                }
                if to == "Miles" {
                    toUnit.text = String(from / 1609.34)
                }
            }
            
            if fromLabel.text == "Yards" {
                if to == "Yards" {
                    toUnit.text = fromUnit.text
                }
                if to == "Meters" {
                    toUnit.text = String(from / 1.0936)
                }
                if to == "Miles" {
                    toUnit.text = String(from / 1760)
                }
            }
            
            if fromLabel.text == "Miles" {
                if to == "Yards" {
                    toUnit.text = String(from * 1760)
                }
                if to == "Meters" {
                    toUnit.text = String(from * 1609.34)
                }
                if to == "Miles" {
                    toUnit.text = fromUnit.text
                }
            }
        } else {
            if let to: Double = Double(toUnit.text!) {
                let from: String = fromLabel.text!
                if toLabel.text == "Meters" {
                    if from == "Yards" {
                        fromUnit.text = String(to * 1.0936)
                    }
                    if from == "Meters" {
                        fromUnit.text = toUnit.text
                    }
                    if from == "Miles" {
                        fromUnit.text = String(to / 1609.34)
                    }
                }
                
                if toLabel.text == "Yards" {
                    if from == "Yards" {
                        fromUnit.text = toUnit.text
                    }
                    if from == "Meters" {
                        fromUnit.text = String(to / 1.0936)
                    }
                    if from == "Miles" {
                        fromUnit.text = String(to / 1760)
                    }
                }
                
                if toLabel.text == "Miles" {
                    if from == "Yards" {
                        fromUnit.text = String(to * 1760)
                    }
                    if from == "Meters" {
                        fromUnit.text = String(to * 1609.34)
                    }
                    if from == "Miles" {
                        fromUnit.text = toUnit.text
                    }
                }
            }
        }
    }
}

