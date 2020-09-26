//
//  VolumeViewController.swift
//  ConversionApp
//
//  Created by Pratty A. Hongsyvilay on 9/25/20.
//  Copyright © 2020 Pratty A. Hongsyvilay. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController, UnitSelectionViewControllerDelegate {
     
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
                dest.delegate = self
            }
        }
    }
    
    @IBAction func calculateConversion(_ sender: Any) {
        if let from: Double = Double(fromUnit.text!) {
            let to: String = toLabel.text!
            if fromLabel.text == "Gallons" {
                if to == "Liters" {
                    toUnit.text = String(from * 3.785)
                }
                if to == "Gallons" {
                    toUnit.text = fromUnit.text
                }
                if to == "Quarts" {
                    toUnit.text = String(from * 3.785 * 1.057)
                }
            }
            
            if fromLabel.text == "Liters" {
                if to == "Liters" {
                    toUnit.text = fromUnit.text
                }
                if to == "Gallons" {
                    toUnit.text = String(from / 3.785)
                }
                if to == "Quarts" {
                    toUnit.text = String(from * 1.057)
                }
            }
            
            if fromLabel.text == "Quarts" {
                if to == "Liters" {
                    toUnit.text = String(from * 1.057)
                }
                if to == "Gallons" {
                    toUnit.text = String(from * 3.785 * 1.057)
                }
                if to == "Quarts" {
                    toUnit.text = fromUnit.text
                }
            }
        } else {
            if  let to: Double = Double(toUnit.text!) {
                let from: String = fromLabel.text!
                if toLabel.text == "Gallons" {
                    if from == "Liters" {
                        fromUnit.text = String(to * 3.785)
                    }
                    if from == "Gallons" {
                        fromUnit.text = toUnit.text
                    }
                    if from == "Quarts" {
                        fromUnit.text = String(to * 3.785 * 1.057)
                    }
                }
                
                if toLabel.text == "Liters" {
                    if from == "Liters" {
                        fromUnit.text = toUnit.text
                    }
                    if from == "Gallons" {
                        fromUnit.text = String(to / 3.785)
                    }
                    if from == "Quarts" {
                        fromUnit.text = String(to * 1.057)
                    }
                }
                
                if toLabel.text == "Quarts" {
                    if from == "Liters" {
                        fromUnit.text = String(to * 1.057)
                    }
                    if from == "Gallons" {
                        fromUnit.text = String(to * 3.785 * 1.057)
                    }
                    if from == "Quarts" {
                        fromUnit.text = toUnit.text
                    }
                }
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
    
    @IBAction func toLenghConv(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func settingsChanged(fromUnit: String, toUnits: String) {
        fromLabel.text = fromUnit
        toLabel.text = toUnits
    }
    
    
}
