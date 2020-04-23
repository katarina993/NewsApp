//
//  CategoryTableViewCell.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/7/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet var categoryNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
