//
//  SourceResponse.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/8/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import Foundation

struct SourceResponse: Codable {
    var status: String
    var sources: [Source]
}
