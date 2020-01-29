//
//  DiagnosisModel.swift
//  MedicalApp
//
//  Created by antonio  on 1/28/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation


struct Diagnosis: Codable {
    let question: QuestionInfo
    let conditions: [ConditionsInfo]
    let should_stop: Bool
}

struct ConditionsInfo: Codable {
    let id : String
    let name: String
    let common_name: String
    let probability: Double
}

struct QuestionInfo: Codable {
    let type: String
    let text: String
    let items: [ItemsInfo]
}

struct ItemsInfo: Codable {
    let id: String
    let name: String
    let choices: [ChoicesInfo]
}

struct ChoicesInfo:Codable {
    let id:String
    let label:String
}

//{
//  "question": {
//    "type": "single",
//    "text": "Please stand on your toes and drop hard onto your heels. Does that hurt your stomach?",
//    "items": [
//      {
//        "id": "s_1922",
//        "name": "Heel drop test",
//        "choices": [
//          {
//            "id": "present",
//            "label": "Yes"
//          },
//          {
//            "id": "absent",
//            "label": "No"
//          },
//          {
//            "id": "unknown",
//            "label": "Don't know"
//          }
//        ]
//      }
//    ],
//    "extras": {}
//  },
//  "conditions": [
//    {
//      "id": "c_132",
//      "name": "Appendicitis",
//      "common_name": "Appendicitis",
//      "probability": 0.255
//    },
//    {
//      "id": "c_885",
//      "name": "Abdominal aortic dissection",
//      "common_name": "Abdominal aortic dissection",
//      "probability": 0.2043
//    },
//    {
//      "id": "c_515",
//      "name": "Gastritis",
//      "common_name": "Gastritis",
//      "probability": 0.078
//    },
//    {
//      "id": "c_1077",
//      "name": "Bacterial gastroenteritis",
//      "common_name": "Bacterial gastroenteritis",
//      "probability": 0.0514
//    },
//    {
//      "id": "c_138",
//      "name": "Food poisoning",
//      "common_name": "Food poisoning",
//      "probability": 0.0499
//    },
//    {
//      "id": "c_1076",
//      "name": "Viral gastroenteritis",
//      "common_name": "Viral gastroenteritis",
//      "probability": 0.0498
//    },
//    {
//      "id": "c_142",
//      "name": "Irritable bowel syndrome",
//      "common_name": "Irritable bowel syndrome",
//      "probability": 0.0462
//    }
//  ],
//  "extras": {},
//  "should_stop": false
//}
