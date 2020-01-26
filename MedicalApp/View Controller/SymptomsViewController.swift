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
    
    private lazy var humansSymptomCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 70, height: 70)
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
//        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .blue
        
        return collectionView
    }()
    
    func CollectionViewConstraints(){
        view.addSubview(humansSymptomCollectionView)
        view.insertSubview(symptomsTableView, aboveSubview: humansSymptomCollectionView)
//        view.didAddSubview(humansSymptomCollectionView)
        humansSymptomCollectionView.translatesAutoresizingMaskIntoConstraints = false
        humansSymptomCollectionView.topAnchor.constraint(equalTo: symptomsSearchBar.bottomAnchor, constant: 0).isActive = true
        humansSymptomCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        humansSymptomCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        humansSymptomCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    
    
//    humansSymptomCollectionView
    var humansSymptoms = [String](){
        didSet {
            DispatchQueue.main.async {
                self.humansSymptomCollectionView.reloadData()
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
        CollectionViewConstraints()

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
//        humansSymptomCollectionView.delegate = self
//        humansSymptomCollectionView.dataSource = self
        
        self.symptomsTableView.isHidden = true
        
//        let flowLayout = UICollectionViewFlowLayout()
//        // Don't miss this line, or collectionView will use autosizing by default
//        flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
////        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
////        view.addSubview(collection)
//        humansSymptomCollectionView.delegate = self
//        humansSymptomCollectionView.dataSource = self
        
        let collectionViewFlowLayout = humansSymptomCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        

        
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
        
        if tableView == self.humansSymptomCollectionView {
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
        
//        if tableView == self.humansSymptomCollectionView {
//            guard let cell = humansSymptomCollectionView.dequeueReusableCell(withIdentifier: "humanSymptoms", for: indexPath) as? HumanSymptomsTableViewCell else {return UITableViewCell()}
//             let info = humansSymptoms[indexPath.row]
//            print(info)
//            cell.symptoms.text = info
//            return cell
//        }

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

extension SymptomsViewController:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return humansSymptoms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = humansSymptomCollectionView.dequeueReusableCell(withReuseIdentifier: "humanSymptoms", for: indexPath) as? HumanSymptomsCollectionViewCell else {
            
            return UICollectionViewCell()
        }
            
         let info = humansSymptoms[indexPath.row]
        
        collectionCell.sympotomsInfo.text = info.separate(every: 8, with: "/n")
        
        print(info.separate(every: 8, with: "/n "))

//        cell.symptoms.text = info
//        collectionCell.sizeToFit()
        return collectionCell
    }
    
}

extension SymptomsViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {


        return CGSize(width:view.bounds.width - 40, height: view.bounds.height)
    }
    
}
