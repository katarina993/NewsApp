//
//  ContentViewController.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/16/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    
    var article: Article?
  
    
    @IBOutlet var contentTableView: UITableView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        title = article?.title
        contentTableView.rowHeight = UITableView.automaticDimension
        contentTableView.estimatedRowHeight = UITableView.automaticDimension
    
    }
    func numberOfSections(in tableView: UITableView) -> Int {
      return 3
    }
    
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if section == 0 {
           return 1
         } else if section == 1 {
           return 1
         } else {
           return 1
         }
       }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 220.0
        } else if indexPath.section == 1 {
            return 50.0
        } else {
            return UITableView.automaticDimension
        }
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contentFirstIdentifier", for: indexPath) as! ContentFirstTableViewCell
           
            if article?.urlToImage != nil {
                cell.setImage(fromUrl: (article?.urlToImage!)!)
            } else {
                cell.contentImage.image = UIImage(named: "No_Image_Available")
            }
            return cell
            
        } else if indexPath.section == 1 {
          let cell = tableView.dequeueReusableCell(withIdentifier: "contentSecondIdentifier", for: indexPath) as! ContentSecondTableViewCell
           
            if let label = cell.dateLabel {
                label.text = article?.publishedAt
            }
            if let autorLabel = cell.autorLabel {
                autorLabel.text = article?.author
            }
            return cell

        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contentThirdIdentifier", for: indexPath) as! ContentThirdTableViewCell
            
            if let textLabel = cell.contentTextLabel {
                textLabel.text = article?.content
                print(article?.content)
            }
            return cell
        }
            
      else {
            return UITableViewCell()
        }
    
    }
}

