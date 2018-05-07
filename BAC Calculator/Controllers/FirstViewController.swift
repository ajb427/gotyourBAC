//
//  FirstViewController.swift
//  BAC Calculator
//
//  Created by Matthew Schwarz on 4/12/18.
//  Copyright © 2018 Schwarz, Matthew. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var genderButton: UISegmentedControl!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
//    @IBOutlet weak var tempLabel: UILabel!
    
    var genderValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        
        let currentValue = Int(sender.value)
        
        weightLabel.text = "\(currentValue)"
        
        
    }
    @IBAction func genderAction(_ sender: UISegmentedControl) {
        switch genderButton.selectedSegmentIndex
        {
        case 0:
//            tempLabel.text = "Male";
            genderValue = 0
            
        case 1:
//            tempLabel.text = "Female";
            genderValue = 1

        default:
            break
        }
       
        
    }
    
    
}

