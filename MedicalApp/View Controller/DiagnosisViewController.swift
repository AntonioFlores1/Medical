//
//  DiagnosisViewController.swift
//  MedicalApp
//
//  Created by antonio  on 1/28/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class DiagnosisViewController: UIViewController {

    
    var diagnosisQuestion = [Diagnosis]() {
        didSet {
            print("We made it")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diagnosisAPI()
    }

    func diagnosisAPI(){
        DiagnosisAPI.diagnosis { (result) in
            switch result {
            case .failure(let error):
                print("You fucked up \(error)")
            case .success(let data):
                self.diagnosisQuestion = [data]
                dump(data)
                print("We here")
            }
        }
}

    
    
}
