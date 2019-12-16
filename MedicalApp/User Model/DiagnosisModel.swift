//
//  DiagnosisModel.swift
//  MedicalApp
//
//  Created by Pursuit on 9/15/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct DiagnosisInfo: Codable {
    let question: QuestionInfo
    let conditions: [ListOfConditions]
}

struct QuestionInfo: Codable {
    let text: String
    let items: [ItemsInfo]
}

struct ItemsInfo: Codable {
   let id: String
   let name: String
   let choices: [ChoiceSelection]
}

struct ChoiceSelection:Codable {
   let id: String
   let label: String
}

struct ListOfConditions: Codable {
    let id: String
    let name: String
    let common_name: String
    let probability: Double
}
