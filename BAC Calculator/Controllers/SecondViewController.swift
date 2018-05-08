//
//  SecondViewController.swift
//  BAC Calculator
//
//  Created by Matthew Schwarz on 4/12/18.
//  Copyright © 2018 Schwarz, Matthew. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var btnSelect: UIBarButtonItem!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var bac: UILabel!
    
    var previousConsumed:Float = 0.0
    
    var currentConsumed:Float = 0.0
    
    var finalBAC:Float = 0.0
    
    var alcohol = [BAC]()
    
    var gender = Int()
    
    let vc = FirstViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
 //       alcohol = BAC.retrieve()
    
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let bacArray = try? context.fetch(BAC.fetchRequest() as NSFetchRequest<BAC>){
                alcohol = bacArray
                tableView.reloadData()
                
            }
        }
    }
    
    // Select item from tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    // Returns count of items in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alcohol.count;
    }
    
    //Assign values for tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        
        if let cell = cell as? DrinksTableViewCell {
            let alcoholNames = self.alcohol[indexPath.row]

            cell.drinksLabel.text = alcoholNames.name
            
            previousConsumed = currentConsumed
            
            currentConsumed = ((alcoholNames.servingSize * alcoholNames.proof) * 5.14) + previousConsumed
            
            finalBAC = ((currentConsumed)/(180.0 * 0.73)) - (0.015 * 1.0)
            
        }

        bac.text = " BAC = \(finalBAC)"
        return cell
        
    }
    
    
    @IBAction func barButtonTapped(_ sender: UIBarButtonItem) {
    
    }
    
    
    
    
}
