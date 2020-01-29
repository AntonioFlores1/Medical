//
//  SymptomsModel.swift
//  MedicalApp
//
//  Created by Pursuit on 8/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Symptoms:Codable {
    let id : String
    let label : String
}


struct DiagnosisPost:Codable {
    let sex:String
    let age: Int
    let evidence: [EvidenceInfo]
}

struct EvidenceInfo:Codable {
    let id:String
    let choice_id: String
    let initial: String?
}


//{
//  "sex": "male",
//  "age": 25,
//  "evidence": [
//    {
//      "id": "s_299",
//      "choice_id": "present",
//      "initial": "true"
//    },
//    {
//      "id": "s_1369",
//      "choice_id": "present"
//    },
//    {
//      "id": "s_1195",
//      "choice_id": "present"
//    },
//    {
//      "id": "p_182",
//      "choice_id": "absent"
//    }
//  ]
//}

//{
//  "sex": "male",
//  "age": {},
//  "evidence": [
//    {
//      "id": "string",
//      "initial": true,
//      "related": true,
//      "choice_id": "present",
//      "observed_at": "string"
//    }
//  ],
//  "extras": {},
//  "evaluated_at": "string"
//}
