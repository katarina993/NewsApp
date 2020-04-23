//
//  HeadlineTableViewCell.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/8/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {
    
    @IBOutlet var headlineLabel: UILabel!

    @IBOutlet weak var headlineImage: UIImageView!
    
    func setImage(fromUrl url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.headlineImage.image = image
            }
        }
    }
    

}
