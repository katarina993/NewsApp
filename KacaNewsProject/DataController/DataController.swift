//
//  DataController.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/7/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import Foundation

let baseUrl = "https://newsapi.org/"
let apiKey = "fd24ccba1c8f42c0b4a7202732c83908"

enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
  case put = "PUT"
  case patch = "PATCH"
  case delete = "DELETE"
}

enum HTTPStatusCode {
  case ok
  case badRequest
  case unauthorized
  case tooManyRequests
  case serverError
  case unKnown
  
  init(statusCode: Int) {
    switch statusCode {
    case 200:
      self = .ok
    case 400:
      self = .badRequest
    case 401:
      self = .unauthorized
    case 429:
      self = .tooManyRequests
    case 500:
      self = .serverError
    default:
      self = .unKnown
    }
  }
}

class DataController {

static let shared = DataController()

private init() {}
func executeRequest(endpoint: String,
                      method: HTTPMethod,
                      queryParams: [String: String]? = nil,
                      body: Data? = nil,
                      completion: @escaping (Data?, HTTPStatusCode, Error?) -> Void)
  {
    var components = URLComponents(string: baseUrl + endpoint)!
    var params = [String: String]()
    if queryParams != nil {
        queryParams!.forEach { (k,v) in params[k] = v }
    }
    params["apiKey"] = apiKey
    components.queryItems = params.map { (key, value) in
          URLQueryItem(name: key, value: value)
      }
    var request = URLRequest(url: components.url!)
      request.httpMethod = method.rawValue
      request.httpBody = body
      
      // Add header field
      request.addValue("application/json", forHTTPHeaderField: "Content-Type")

      let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        let statusCode = (response as! HTTPURLResponse).statusCode
        #if DEBUG
        if data != nil {
          if let logMessage = String(data: data!, encoding: .utf8) {
            NSLog("Requested: \(endpoint)")
            NSLog("Status code: \(statusCode)")
            NSLog("Response: \(logMessage)")
          }
        }
        #endif
        
        
        let httpStatusCode = HTTPStatusCode(statusCode: statusCode)
//        sleep(1)
        completion(data, httpStatusCode, error)
      }
      dataTask.resume()
    }
  }


