//
//  NewsSourcesViewController.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/7/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import UIKit

class NewsSourcesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    
    
    var category: String? = nil
    @IBOutlet weak var soucesTableView: UITableView!
    
    var sources:[Source] = [Source]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DataController.shared.getSources(category: category) { (sources) in
            DispatchQueue.main.async {
                if sources != nil {
                    self.sources = sources!
                    self.soucesTableView.reloadData()
                } else {
                    //greska
                }
                
            }
            
        }
        
    }
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }


     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sourceCellidentifier", for: indexPath) as! SourcesTableViewCell
       
        
        let source = sources[indexPath.row]
        
            cell.nameLabel.text = source.name
            cell.descriptionLabel.text = source.description

        
        
            
        return cell
   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedSource = sources[indexPath.row]
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "headlineStoryboard") as! HeadlineViewController
               vc.source = selectedSource
               self.navigationController?.pushViewController(vc, animated: true)
    }
}

