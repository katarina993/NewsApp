//
//  DataController+CategoryViewController.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/7/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import UIKit

extension DataController {
    
    
    func getSources(category: String?, completion: @escaping ([Source]?) -> Void) {
        
        var endpoint = ""
        if category == nil {
            endpoint = "v2/sources?apiKey=fd24ccba1c8f42c0b4a7202732c83908"
        } else {
            endpoint = "v2/sources?category=\(category!)&apiKey=fd24ccba1c8f42c0b4a7202732c83908"
            }
        
        
      executeRequest(endpoint: endpoint, method: .get) { (data, statusCode, error) in
        if statusCode == .ok && data != nil {

            let sourceResponse = try! JSONDecoder().decode(SourceResponse.self, from:data!)
            let source = sourceResponse.sources
            completion(source)
        } else {
            completion(nil)
        }
      }
    }
  }
