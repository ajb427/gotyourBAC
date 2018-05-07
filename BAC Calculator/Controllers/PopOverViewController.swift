

import UIKit

class PopOverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var Popupview: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var alcohol = [AlcoholTypes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Apply radius to Popupview
        Popupview.layer.cornerRadius = 10
        Popupview.layer.masksToBounds = true
        
        alcohol = AlcoholTypes.retrieve()
        tableView.reloadData()
    }
    
    // Select item from tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    // Returns count of items in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alcohol.count;
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let savedContent = BAC(name: alcohol[indexPath.row].name, servingSize: alcohol[indexPath.row].servingSize, proof: alcohol[indexPath.row].proof) else {
            
            return
            
        }
    
        
        
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //Assign values for tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let cell = cell as? AlcoholTableViewCell {
            let alcoholNames = self.alcohol[indexPath.row]
            
            cell.alcoholNameLabel.text = alcoholNames.name
        }
        
        return cell
    }
    
    // Close PopUp
    @IBAction func closePopup(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}

