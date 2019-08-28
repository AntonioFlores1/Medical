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
let symptom = "https://api.infermedica.com/v2/search?phrase=\(keyword)&sex=female&max_results=8"
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


class DefaultSymptoms {
    var symptoms: String
    init(sypmtoms:String) {
        self.symptoms = sypmtoms
    }
    let allSymptomsList = [
        DefaultSymptoms.init(sypmtoms: "Abdominal pain"),
        DefaultSymptoms.init(sypmtoms: "Abdominal pain, severe"),
        DefaultSymptoms.init(sypmtoms: "Abdominal pain, postprandial"),
        DefaultSymptoms.init(sypmtoms: "Abdominal pain, sharp and stabbing"),
        DefaultSymptoms.init(sypmtoms: "Abdominal pain, exacerbating during coughing or movement"),
        DefaultSymptoms.init(sypmtoms: "abdominal pain on inspiration"),
        DefaultSymptoms.init(sypmtoms: "Abdominal pain, exacerbating on an empty stomach"),
        DefaultSymptoms.init(sypmtoms: "Abdominal pain, epigastric"),
        DefaultSymptoms.init(sypmtoms: "cough"),
        DefaultSymptoms.init(sypmtoms: "Chest pain"),
        DefaultSymptoms.init(sypmtoms: "cough"),
        DefaultSymptoms.init(sypmtoms: "can't breathe"),
        DefaultSymptoms.init(sypmtoms: "Dermatological changes"),
        DefaultSymptoms.init(sypmtoms: "crying"),
        DefaultSymptoms.init(sypmtoms: "Cough, dry"),
        DefaultSymptoms.init(sypmtoms: "constipation"),
        DefaultSymptoms.init(sypmtoms: "Fever between 98.6 and 100.4°F (37 and 38°C)"),
        DefaultSymptoms.init(sypmtoms: "thing"),
        DefaultSymptoms.init(sypmtoms: "thing"),
        DefaultSymptoms.init(sypmtoms: "thing"),
        DefaultSymptoms.init(sypmtoms: "thing"),
        DefaultSymptoms.init(sypmtoms: "thing"),
    ]
}
