//
//  HeadlineViewController.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/8/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import UIKit

class HeadlineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var source:Source?
    var articles:[Article] = [Article]()
    var filteredArticles: [Article] = []
    let searchController = UISearchController(searchResultsController: nil)
     
    var isSearchBarEmpty: Bool {
             return searchController.searchBar.text?.isEmpty ?? true
           }
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    @IBOutlet var headlineTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if source?.id == nil {
            return
        }
        DataController.shared.getHeadline(source: source!.id!) { (articles) in
            DispatchQueue.main.async {
                if articles != nil {
                    self.articles = articles!
                    self.headlineTableView.reloadData()
                } else {
                //greska
                }
            }
        }
 
        // 1
        searchController.searchResultsUpdater = nil
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search Headline"
        // 4
        searchController.searchBar.delegate = self
        // 5
        definesPresentationContext = true
        //6
        navigationItem.searchController = searchController
        
       
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredArticles.count
        }
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "headlineCell", for: indexPath) as! HeadlineTableViewCell
       
        var article = articles[indexPath.row]
        if let label = cell.headlineLabel {
            label.text = article.title
        }
        if isFiltering {
            article = filteredArticles[indexPath.row]
        }
        
        cell.headlineImage.clipsToBounds = true
        if article.urlToImage != nil {
            cell.setImage(fromUrl: article.urlToImage!)
   
        } else {
            cell.headlineImage.image = UIImage(named: "No_Image_Available")
        }
        return cell
   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = articles[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "contentViewController") as! ContentViewController
        vc.article = selectedArticle
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension HeadlineViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search button click")
        DataController.shared.searchHeadlines(source: source!.id!, query:"q" ) { (articles) in
            DispatchQueue.main.async {
                if self.filteredArticles != nil {
                        self.filteredArticles = articles!
                        self.headlineTableView.reloadData()
                    } else {
                    //greska
                    }
               
                }
                
                }
            }
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.searchTextField.text == "" {
            self.headlineTableView.reloadData()
        }
        
        
           print("searchText \(searchText)")
       }
   
        
        
    }
          

              
    
    
   
