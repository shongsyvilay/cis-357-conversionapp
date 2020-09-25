//
//  ViewController.swift
//  ConversionApp
//
//  Created by Pratty A. Hongsyvilay on 9/25/20.
//  Copyright © 2020 Pratty A. Hongsyvilay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fromUnit: DecimalMinusTextField!
    @IBOutlet weak var toUnit: DecimalMinusTextField!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clearFields(_ sender: UIButton) {
        fromUnit.text = ""
        toUnit.text = ""
    }
    
}

