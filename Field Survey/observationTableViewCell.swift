//
//  observationTableViewCell.swift
//  Field Survey
//
//  Created by Davis Haeusser on 11/20/19.
//  Copyright © 2019 Davis Haeusser. All rights reserved.
//

import UIKit

class observationTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
