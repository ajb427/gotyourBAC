//
//  ThirdViewController.swift
//  BAC Calculator
//
//  Created by Matthew Schwarz on 5/7/18.
//  Copyright © 2018 Schwarz, Matthew. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let foods = ["IPA - May 4", "IPA - May 4", "Cosmopolitan - May 4", "Mai-Tai - May 5", "Red Wine - May 6", "Bourbon - May 7", "Brown Ale - May 8", "Ipa Double - May 8"]
    override func viewDidLoad() {
        super.viewDidLoad()
  
        tableView.dataSource = self
        tableView.delegate = self
  
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        let foodItem = self.foods[indexPath.row]
        
        cell.textLabel?.text = foodItem
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = foods[indexPath.row]
        print(food)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
