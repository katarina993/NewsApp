//
//  Headline.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/9/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import Foundation

struct Headline: Codable {
    var status: String
    var totalResults: Int
    var articles: [Article]
    
  
}
