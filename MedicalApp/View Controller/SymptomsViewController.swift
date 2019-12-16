//
//  SymptomsViewController.swift
//  MedicalApp
//
//  Created by Pursuit on 8/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SymptomsViewController: UIViewController {
    
    
    @IBOutlet weak var symptomsSearchBar: UISearchBar!
    
    @IBOutlet weak var headerUIView: UIView!
    
    @IBOutlet weak var symptomsTableView: UITableView!
    
    
    var selectedSymptoms = [String](){
        didSet {
            DispatchQueue.main.async {
                self.ListOfSymptomsCollectionView.reloadData()
                self.nextPhase.isHidden = false
            }
        }
    }
    
    
    var symptoms = [Symptoms]() {
        didSet {
            DispatchQueue.main.async {
                self.symptomsTableView.reloadData()
            }
        }
    }
    
    

    
    
    lazy var ListOfSymptomsCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionViewLayout.estimatedItemSize = CGSize(width: 50, height: 50)
        collectionViewLayout.minimumInteritemSpacing = 5
        collectionViewLayout.minimumLineSpacing = 5
        collectionView.showsVerticalScrollIndicator = true
        return collectionView
    }()
    
    lazy var nextPhase: UIButton = {
        var button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.isTranslucent = true
        navigationController?.isNavigationBarHidden = true
        
        headerUIView.clipsToBounds = true
        headerUIView.layer.cornerRadius = 26
        headerUIView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
        let searchTextField = symptomsSearchBar.value(forKey: "searchField") as? UITextField
        searchTextField?.textColor = .black
        searchTextField?.backgroundColor = .clear
        searchTextField?.attributedPlaceholder =  NSAttributedString(string: "     e.g appendicitis", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        symptomsSearchBar.backgroundColor = .clear
        symptomsSearchBar.searchBarStyle = .minimal
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .clear
        print(symptomsSearchBar.text!)
        
        
        symptomsTableView.dataSource = self
        symptomsTableView.delegate = self
        symptomsSearchBar.delegate = self
        ListOfSymptomsCollectionView.delegate = self
        ListOfSymptomsCollectionView.dataSource = self
        self.symptomsTableView.isHidden = true
        
        ListOfSymptomsCollectionView.register(ListOfSymptomsCollectionViewCell.self, forCellWithReuseIdentifier: "ListOfSymptoms")
        collectionViewConstraints()
        
        nextPhaseConstraints()
    
        view.bringSubviewToFront(symptomsTableView)
        
        nextPhase.addTarget(self, action: #selector(diagnosisPhase), for:.touchUpInside)

    }
    
   
    
    func searchSymptoms(_ keyword:String){
        SymptomsAPI.ListOfSymptoms(keyword: keyword) { (appError, symptom) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let symptomData = symptom {
                self.symptoms = symptomData
//                dump(self.symptoms)
            }
        }
    }
    
    func collectionViewConstraints(){
        view.addSubview(ListOfSymptomsCollectionView)
        ListOfSymptomsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        ListOfSymptomsCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70).isActive = true
        ListOfSymptomsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: 0).isActive = true
        ListOfSymptomsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        ListOfSymptomsCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.52).isActive = true
    }
    
    func nextPhaseConstraints(){
        view.addSubview(nextPhase)
        nextPhase.translatesAutoresizingMaskIntoConstraints = false
        nextPhase.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -10).isActive = true
        nextPhase.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
    
    
    @objc func diagnosisPhase(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let diagnosisVC = storyboard.instantiateViewController(withIdentifier: "Diagnosisid")
        navigationController?.pushViewController(diagnosisVC, animated: true)
    }
    
}

extension SymptomsViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symptoms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = symptomsTableView.dequeueReusableCell(withIdentifier: "symptoms", for: indexPath) as? SymptomsTableViewCell else {return UITableViewCell()}
        let info = symptoms[indexPath.row]
        cell.symptomLabel.text = info.label
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        symptomsSearchBar.resignFirstResponder()
        let cellInfo = symptoms[indexPath.row]
        symptomsTableView.isHidden = true
        symptomsSearchBar.text = ""
        self.symptomsTableView.reloadData()
        selectedSymptoms.append("\(cellInfo.label)")
        print(selectedSymptoms)
    }
    
}

extension SymptomsViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //        guard let text = searchBar.text,
        //            !text.isEmpty,
        //            let searchText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
        //                print("not a a valid search")
        //                return
        //        }
        if let text = searchBar.text {
            if text.isEmpty || text == "" {
                symptomsTableView.isHidden = true
            } else {
                symptomsTableView.isHidden = false
                searchSymptoms(text.lowercased())
            }
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let text = searchBar.text,
            !text.isEmpty,
            let searchText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
                print("not a a valid search")
                return
        }
        symptomsTableView.isHidden = false
        searchSymptoms(searchText.lowercased())
    }
}

extension SymptomsViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedSymptoms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let CollectionViewcell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListOfSymptoms", for: indexPath) as? ListOfSymptomsCollectionViewCell else {return UICollectionViewCell()}
        
        let selectedSymptom = selectedSymptoms[indexPath.row]
        CollectionViewcell.symptomLabel.text = selectedSymptom
        CollectionViewcell.layer.cornerRadius = 20
        CollectionViewcell.layer.masksToBounds = true
        CollectionViewcell.sizeToFit()
        //CollectionViewcell.symptomLabel.preferredMaxLayoutWidth = 50
        CollectionViewcell.backgroundColor = .blue
        CollectionViewcell.deleteSymptomButton.tag = indexPath.row
//        ListOfSymptomsCollectionView.deleteItems(at: [indexPath])
        CollectionViewcell.deleteSymptomButton.addTarget(self, action: #selector(deleteSymptomSelected), for: .touchUpInside)
        print(CollectionViewcell.deleteSymptomButton.tag)
        return CollectionViewcell
        
    }
    
    @objc func deleteSymptomSelected(){
        
    }
    
}

extension SymptomsViewController{

    
    
}
