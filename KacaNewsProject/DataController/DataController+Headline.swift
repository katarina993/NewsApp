//
//  DataController+Headline.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/9/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import Foundation



extension DataController {
    static let topHeadlinesEndpoint = "v2/top-headlines"

    func getHeadline(source: String, completion: @escaping ([Article]?) -> Void) {
          var queryParams = [String: String]()
          queryParams["sources"] = source
        executeRequest(endpoint:DataController.topHeadlinesEndpoint,
                       method: .get,
                       queryParams: queryParams) { (data, statusCode, error) in
            if statusCode == .ok && data != nil {
                let headlineResponse = try! JSONDecoder().decode(Headline.self, from:data!)
                let headline = headlineResponse.articles
                completion(headline)
                
            } else {
                completion(nil)
                
            }
            
        }
    }
    
    func searchHeadlines(source: String, query: String, completion: @escaping ([Article]?) -> Void) {

        var queryParams = [String: String]()
        queryParams["sources"] = source
        queryParams["q"] = query
        executeRequest(endpoint: DataController.topHeadlinesEndpoint,
                       method: .get,
                       queryParams: queryParams) { (data, statusCode, error) in
            if statusCode == .ok && data != nil {
                let headlineResponse = try! JSONDecoder().decode(Headline.self, from:data!)
                let headline = headlineResponse.articles
                completion(headline)
                
            } else {
                completion(nil)
                
            }
        }
        
    }
}

    
       
        
    
