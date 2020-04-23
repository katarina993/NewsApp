//
//  ViewController.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/6/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var categoryList = ["Business", "Entertainment", "General", "Health", "Science", "Sports", "Technology"]
     
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
               return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
            cell.textLabel?.text = self.categoryList[indexPath.row]
            return cell
        
    }
    func openMainScreen() {
      let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let mainVC = mainStoryboard.instantiateInitialViewController()
      
      if let window = UIApplication.shared.keyWindow {
        window.rootViewController = mainVC
      }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
                   cell.textLabel?.text = self.categoryList[indexPath.row]
        let category = categoryList[indexPath.row]
        goToView(sender: cell, category: category)
    }
    
    func goToView(sender:UITableViewCell, category: String) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! NewsSourcesViewController
        secondVC.category = category
        navigationController?.pushViewController(secondVC,
        animated: true)
    }
}

