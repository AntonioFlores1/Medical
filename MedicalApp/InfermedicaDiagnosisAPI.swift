//
//  InfermedicaDiagnosisAPI.swift
//  MedicalApp
//
//  Created by Pursuit on 8/16/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class DiagnosisAPI {
    static func Diagnosis(completionHandler: @escaping (AppError?,QuestionInfo?)-> Void ){
    
    let diagnosisLink = "https://api.infermedica.com/v2/diagnosis"
        
        NetworkHelper.shared.performUploadTask(endpointURLString: diagnosisLink, httpMethod: "POST", httpBody: nil) { (appError, data, httpResponse) in
            
            if let appError = appError {
                completionHandler(appError,nil)
            }
            
            guard let response = httpResponse, (200...299).contains(response.statusCode) else {
                let statusCode = httpResponse?.statusCode ?? -999
                completionHandler(AppError.badStatusCode(statusCode.description), nil)
                return
            }
            
            if let data = data {
                do {
                    let list = try JSONDecoder().decode(DiagnosisInfo.self, from: data)
                    completionHandler(nil,list.question)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error),nil)
                }
            }
            
        }
        
    }
    
    
    
}
