//
//  SnackTableViewCell.swift
//  Stretchy-Snacks
//
//  Created by Dave Augerinos on 2017-03-17.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

class SnackTableViewCell: UITableViewCell {

    @IBOutlet weak var snackLabel: UILabel!
    
    func configureSnackCell(with snackItem: SnackItem) {
        
        snackLabel.text = snackItem.snack.rawValue
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
