//
//  SecondViewController.swift
//  BAC Calculator
//
//  Created by Matthew Schwarz on 4/12/18.
//  Copyright © 2018 Schwarz, Matthew. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var btnSelect: UIBarButtonItem!
    
    @IBOutlet var tableView: UITableView!
    
    var alcohol = [AlcoholTypes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        alcohol = AlcoholTypes.retrieve()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        }
        
        return cell
    }
    
    @IBAction func barButtonTapped(_ sender: UIBarButtonItem) {
    
    }
    
    
}
