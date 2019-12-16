//
//  InfermedicalSearchSymptoms.swift
//  MedicalApp
//
//  Created by Pursuit on 8/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


final class SymptomsAPI{
    static func ListOfSymptoms(keyword: String, completionHandler: @escaping (AppError?,[Symptoms]?) -> Void) {
        let symptom = "https://api.infermedica.com/v2/search?phrase=\(keyword)&sex=female&max_results=8&type=symptom"
        
        
        NetworkHelper.shared.performDataTask(endpointURLString:symptom, httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError,nil)
            }
            guard let response = httpResponse,
                (200...299).contains(response.statusCode) else {
                    let statusCode = httpResponse?.statusCode ?? -999
                    completionHandler(AppError.badStatusCode(String(statusCode)), nil)
                    return
            }
            if let data = data {
                do {
                    
                    let list = try JSONDecoder().decode([Symptoms].self, from: data)
                    completionHandler(nil,list)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error),nil)
                }
            }
        }
    }
}
