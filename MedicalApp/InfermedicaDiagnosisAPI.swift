//
//  InfermedicaDiagnosisAPI.swift
//  MedicalApp
//
//  Created by Pursuit on 8/16/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class DiagnosisAPI {
    static func diagnosis(completionHandler:@escaping (Result<Diagnosis,AppError>)->()){
        let urlLink = "https://api.infermedica.com/v2/diagnosis"
        
        let symptomsArray = [EvidenceInfo(id: "s_299", choice_id: "present", initial: "true"),EvidenceInfo(id: "s_1369", choice_id: "present", initial: nil),EvidenceInfo(id: "s_1195", choice_id: "present", initial: nil)]
        
        let getDiagnosisPost = DiagnosisPost(sex: "male", age: 25, evidence: symptomsArray)
        
        do {
            let data = try JSONEncoder().encode(getDiagnosisPost)
            
            NetworkHelper.shared.performUploadTask(endpointURLString:urlLink, httpMethod: "POST", httpBody: data) { (appError, data, httpResponse) in
                      if let appError = appError {
                          completionHandler(.failure(appError))
                      }
                      guard let response = httpResponse,
                          (200...299).contains(response.statusCode) else {
                              let statusCode = httpResponse?.statusCode ?? -999
                              completionHandler(.failure(.badStatusCode(statusCode.description)))
                              return
                      }
                      if let data = data {
                          do {
                              let list = try JSONDecoder().decode(Diagnosis.self, from: data)
                              completionHandler(.success(list))
                          } catch {
                              completionHandler(.failure(.jsonDecodingError(error)))
                          }
                      }
                  }
        } catch {
            print("Major error in Diagnosis Model or Diagnosis API \(error)")
        }
        
        
        
        
    }
    

}
