//
//  ContentTableViewCell.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/16/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import UIKit

class ContentFirstTableViewCell: UITableViewCell {

    
    @IBOutlet var contentImage: UIImageView!
    
    func setImage(fromUrl url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
             self.contentImage.image = image
            }
        }
    }
    
}
