//
//  HumanSymptomsTableViewCell.swift
//  MedicalApp
//
//  Created by Pursuit on 8/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class HumanSymptomsTableViewCell: UITableViewCell {

    @IBOutlet weak var symptoms: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
