//
//  SecondViewController.swift
//  Stroke Risk Score
//
//  Created by lance on 2017/10/25.
//  Copyright © 2017年 lance. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var scoreVasc = 0
    @IBAction func share(_ sender: UIBarButtonItem) {
        
        
    }
    
    @IBOutlet weak var CHF: UISwitch!
    @IBOutlet weak var BP: UISwitch!
    @IBOutlet weak var age: UISwitch!
    @IBOutlet weak var DM: UISwitch!
    @IBOutlet weak var history: UISwitch!
    @IBOutlet weak var vascular: UISwitch!
    
    @IBOutlet weak var age65: UISwitch!
    @IBOutlet weak var female: UISwitch!
    
    
    @IBOutlet weak var strokeScore: UILabel!
    @IBOutlet weak var strokeRisk: UILabel!
    
    
    
    @IBAction func calulate(_ sender: UIButton) {
        
        scoreVasc = 0
        if CHF.isOn {
            scoreVasc += 1
        }
        if BP.isOn {
            scoreVasc += 1
        }
        if age.isOn {
            scoreVasc += 2
        } else if age65.isOn {
            scoreVasc += 1
        }
        if DM.isOn {
            scoreVasc += 1
        }
        if history.isOn {
            scoreVasc += 2
        }
        if vascular.isOn {
            scoreVasc += 1
        }
        if female.isOn {
            scoreVasc += 1
        }
        if scoreVasc == 10 {
            strokeScore.text = "CHA2DS2-VASc Stroke Risk Score: " + String(scoreVasc - 1)
        } else {
            strokeScore.text = "CHA2DS2-VASc Stroke Risk Score: " + String(scoreVasc)
        }
        strokeRisk.text = "Adjusted Stroke Risk: " + strokeRiskCalVasc() + "%"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    func strokeRiskCalVasc() -> String {
        
        if scoreVasc == 9 || scoreVasc == 10 {
            return "15.2"
        }else if scoreVasc == 8{
            return "12.5"
        } else if scoreVasc == 7{
            return "9.6"
        } else if scoreVasc == 6 {
            return "9.8"
        } else if scoreVasc == 5 {
            return "6.7"
        }else if scoreVasc == 4 {
            return "4.0"
        } else if scoreVasc == 3 {
            return "3.2"
        } else if scoreVasc == 2 {
            return "2.2"
        } else if scoreVasc == 1 {
            return "1.3"
        } else {
            return "0"
        }
        
    }
}

