//
//  NetworkHelper.swift
//  MedicalApp
//
//  Created by Pursuit on 8/16/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

public final class NetworkHelper {
    private init() {
        let cache = URLCache(memoryCapacity: 10 * 1024 * 1024, diskCapacity: 10 * 1024 * 1024, diskPath: nil)
        URLCache.shared = cache
    }
    public static let shared = NetworkHelper()
    
    func performDataTask(endpointURLString: String,
                         httpMethod: String,
                         httpBody: Data?,
                         completionHandler: @escaping (AppError?, Data?, HTTPURLResponse?) ->Void) {
        guard let url = URL(string: endpointURLString) else {
            completionHandler(AppError.badURL("\(endpointURLString)"), nil, nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("9e4ec077", forHTTPHeaderField:"App-Id" )
        request.setValue("8dd49dc91c7b2344949e7b5489323d59", forHTTPHeaderField:"App-Key" )
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(AppError.networkError(error), nil, response as? HTTPURLResponse)
                return
            } else if let data = data {
                completionHandler(nil, data, response as? HTTPURLResponse)
            }
        }
        task.resume()
    }
    
    
    func performUploadTask(endpointURLString: String,
                           httpMethod: String,
                           httpBody: Data?,
                           completionHandler: @escaping (AppError?, Data?, HTTPURLResponse?) ->Void) {
        guard let url = URL(string: endpointURLString) else {
            completionHandler(AppError.badURL("\(endpointURLString)"), nil, nil)
            return
        }
        
//        let list = [["id": "s_1193","choice_id": "present"],
//                    ["id": "s_488","choice_id": "present"],
//                    ["id": "s_418","choice_id": "present"]]
//
//        let body:[String:AnyObject] = ["sex":"male" as AnyObject,
//                                       "age": 30 as AnyObject,
//                                       "evidence": list as AnyObject]
        
        
        let body = """
 {
            "sex": "male",
        "age": 30,
        "evidence": [
        {
        "id": "s_1193",
        "choice_id": "present"
        },
        {
        "id": "s_488",
        "choice_id": "present"
        },
        {
        "id": "s_418",
        "choice_id": "present"
        }
        ]}
 """
        
        let jsonData = body.data(using: .utf8, allowLossyConversion: false)!
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("9e4ec077", forHTTPHeaderField:"App-Id" )
        request.setValue("8dd49dc91c7b2344949e7b5489323d59", forHTTPHeaderField:"App-Key" )
        request.httpBody = jsonData
        
        let task = URLSession.shared.uploadTask(with: request, from: httpBody) { (data, response, error) in
            if let error = error {
                completionHandler(AppError.networkError(error), nil, response as? HTTPURLResponse)
                return
            } else if let data = data {
                completionHandler(nil, data, response as? HTTPURLResponse)
            }
        }
        task.resume()
    }
}
