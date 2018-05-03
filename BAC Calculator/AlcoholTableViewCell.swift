//
//  AlcoholTableViewCell.swift
//  BAC Calculator
//
//  Created by Matthew Schwarz on 5/2/18.
//  Copyright © 2018 Schwarz, Matthew. All rights reserved.
//

import UIKit

class AlcoholTableViewCell: UITableViewCell {

    @IBOutlet weak var alcoholNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
