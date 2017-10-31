//
//  FirstViewController.swift
//  Stroke Risk Score
//
//  Created by lance on 2017/10/25.
//  Copyright © 2017年 lance. All rights reserved.
//

import UIKit
import Social

class FirstViewController: UIViewController {

    var score = 0

    
    @IBOutlet weak var CHF: UISwitch!
    @IBOutlet weak var BP: UISwitch!
    @IBOutlet weak var age: UISwitch!
    @IBOutlet weak var DM: UISwitch!
    @IBOutlet weak var history: UISwitch!
    
    @IBOutlet weak var strokeScore: UILabel!
    @IBOutlet weak var strokeRisk: UILabel!
    @IBAction func shareSocial(_ sender: UIBarButtonItem) {
        displayShareSheet(shareContent: "CHADS₂ Stroke Risk Score: " + String(score))
    }
    
    @IBAction func calulate(_ sender: UIButton) {
       
        score = 0
        if CHF.isOn {
            score += 1
        }
        if BP.isOn {
            score += 1
        }
        if age.isOn {
            score += 1
        }
        if DM.isOn {
            score += 1
        }
        if history.isOn {
            score += 2
        }
        
     strokeScore.text = "CHADS₂ Stroke Risk Score: " + String(score)
        
        strokeRisk.text = "Adjusted Stroke Risk: " + strokeRiskCal()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

  
    }

    func strokeRiskCal() -> String {
        if score == 6 {
            return "18.2%"
        } else if score == 5 {
            return "12.5%"
        }else if score == 4 {
            return "8.5%"
        } else if score == 3 {
            return "5.9%"
        } else if score == 2 {
            return "4%"
        } else if score == 1 {
            return "2.8%"
        } else {
            return "1.9%"
        }
        
       
    }
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
        return
    }
    
    func displayShareSheet(shareContent:String) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
        present(activityViewController, animated: true, completion: {})
    }
    
}

