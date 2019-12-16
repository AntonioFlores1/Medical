//
//  DiagnosisViewController.swift
//  MedicalApp
//
//  Created by Pursuit on 9/15/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DiagnosisViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    @IBOutlet weak var diagnosiTableView: UITableView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var practiceDiagnosis = [QuestionInfo](){
        didSet{
            DispatchQueue.main.async {
                self.diagnosiTableView.reloadData()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        diagnosis()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        diagnosiTableView.dataSource = self
        diagnosiTableView.delegate = self
        view.backgroundColor = .red
//        questionLabel.text = practiceDiagnosis.first?.text
    }
    
    
    func diagnosis(){
        DiagnosisAPI.Diagnosis { (appError, data) in
            if let appError = appError{
                print(appError.errorMessage())
            } else if let diagnosisData = data {
                self.practiceDiagnosis = [diagnosisData]
                dump(self.practiceDiagnosis)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return practiceDiagnosis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let collectionViewCell = diagnosiTableView.dequeueReusableCell(withIdentifier: "diagnosisCell", for: indexPath) as? DiagnosisTableViewCell else {return UITableViewCell()}
        
        let diagnosisQuestionnaire = practiceDiagnosis[indexPath.row]
        
        questionLabel.text = diagnosisQuestionnaire.text
        let thing = diagnosisQuestionnaire.items[indexPath.row].choices
        let label = thing.map({$0.label})
        collectionViewCell.choiceLabel.text = label[2]
        return collectionViewCell
    }

    
}
