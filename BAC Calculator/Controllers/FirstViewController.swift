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
    
    var genderValue = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional svarp after loading the view, typically from a nib.
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
            
            let vc = SecondViewController(nibName: "SecondViewController", bundle: nil)
            genderValue = 0
            
            navigationController?.pushViewController(vc, animated: true)
    
        case 1:
//            tempLabel.text = "Female";
            let vc = SecondViewController(nibName: "SecondViewController", bundle: nil)
            genderValue = 1
            
            navigationController?.pushViewController(vc, animated: true)

        default:
            break
        }
       

    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      /* let destViewController: SecondViewController = segue.destination as SecondViewController
        
        destViewController.gender = genderValue
       */
        if segue.destination is SecondViewController
        {
            let vc = segue.destination as? SecondViewController
            vc?.gender = genderValue
        }
    }
    
    
}

