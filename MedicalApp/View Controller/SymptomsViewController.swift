//
//  SymptomsViewController.swift
//  MedicalApp
//
//  Created by Pursuit on 8/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SymptomsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet weak var symptomsSearchBar: UISearchBar!
    
    @IBOutlet weak var headerUIView: UIView!
    
    @IBOutlet weak var symptomsTableView: UITableView!
    
    @IBOutlet weak var humansSymptomTableView: UITableView!
    
    
    var humansSymptoms = [String](){
        didSet {
            DispatchQueue.main.async {
                self.humansSymptomTableView.reloadData()
            }
        }
    }
    
    var listOfSymptoms = [Symptoms]() {
        didSet {
            DispatchQueue.main.async {
                self.symptomsTableView.reloadData()
            }
        }
    }
    
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
        humansSymptomTableView.delegate = self
        humansSymptomTableView.dataSource = self
        
        self.symptomsTableView.isHidden = true
        
    }
    
    func searchSymptoms(_ keyword:String){
    SymptomsAPI.ListOfSymptoms(keyword: keyword) { (appError, symptom) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let symptomData = symptom {
                self.listOfSymptoms = symptomData
                dump(self.listOfSymptoms)
            }
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
    
        if tableView == self.symptomsTableView {
            count = listOfSymptoms.count
        }
        
        if tableView == self.humansSymptomTableView {
            count = humansSymptoms.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == self.symptomsTableView {
            guard let cell = symptomsTableView.dequeueReusableCell(withIdentifier: "symptoms", for: indexPath) as? SymptomsTableViewCell else {return UITableViewCell()}
            let info = listOfSymptoms[indexPath.row]
            cell.symptomLabel.text = info.label
            return cell
        }
        
        if tableView == self.humansSymptomTableView {
            guard let cell = humansSymptomTableView.dequeueReusableCell(withIdentifier: "humanSymptoms", for: indexPath) as? HumanSymptomsTableViewCell else {return UITableViewCell()}
             let info = humansSymptoms[indexPath.row]
            print(info)
            cell.symptoms.text = info
            return cell
        }

        return cell!

    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        symptomsSearchBar.resignFirstResponder()
        let cellInfo = listOfSymptoms[indexPath.row]
        symptomsTableView.isHidden = true
        symptomsSearchBar.text = ""
        self.symptomsTableView.reloadData()
        humansSymptoms.append("\(cellInfo.label)")
        print(humansSymptoms)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        searchBar.resignFirstResponder()
        guard let text = searchBar.text,
            !text.isEmpty,
            let searchText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
                print("not a a valid search")
                return
        }
        symptomsTableView.isHidden = false
        searchSymptoms(searchText.lowercased())
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
//        symptomsTableView.alpha = 1
        
        searchSymptoms(searchText.lowercased())

    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
       
    }
    
}
