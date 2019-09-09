//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPtcButton: UIButton!
    @IBOutlet weak var tenPtcButton: UIButton!
    @IBOutlet weak var twentyPtcButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!

    var tipValue: Double?
    var numberOfPeople: Int?
    var billValue: Double?
    var finalResult: String?

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)

        if(sender.currentTitle == "0%") {
            zeroPtcButton.isSelected = true
            tenPtcButton.isSelected = false
            twentyPtcButton.isSelected = false
            tipValue = Double("0.0")
        } else if (sender.currentTitle == "10%") {
            zeroPtcButton.isSelected = false
            tenPtcButton.isSelected = true
            twentyPtcButton.isSelected = false
            tipValue = Double("0.1")
        } else {
            zeroPtcButton.isSelected = false
            tenPtcButton.isSelected = false
            twentyPtcButton.isSelected = true
            tipValue = Double("0.2")
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        //Get the text the user typed in the billTextField
        let bill = billTextField.text!
        
        if bill != "" {
            billValue = Double(bill)!
            let result = billValue! * (1 + tipValue!) / Double(numberOfPeople!)
            finalResult = String(result)
        }
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = finalResult
            destinationVC.settings = "Split between " + String(numberOfPeople!) + " people with " + String(tipValue!) + " tip"
        }
    }
}

