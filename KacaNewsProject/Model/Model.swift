//
//  Model.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/10/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import Foundation

class Model {

static let shared = Model()

    var sources = [Source]()
    var articles = [Article]()
    
    
    func getSource(id: String) -> Source? {
       for source in sources {
         if source.id == id {
           return source
         }
       }
       return nil
     }
}
