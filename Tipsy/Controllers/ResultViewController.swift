//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Onat KILINÇ on 16.06.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String?
    var settings: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total
        settingsLabel.text = settings
    }

    @IBAction func reCalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
