//
//  ViewController.swift
//  MedicalApp
//
//  Created by Pursuit on 8/15/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var trackerView: UIView!
    
    @IBOutlet weak var infoSlideView: UIView!
    
    @IBOutlet weak var dayStatusIcon: UIImageView!
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dailySetUp(name: "Antonio")
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.isTranslucent = true
        navigationController?.isNavigationBarHidden = true
        
        topView.clipsToBounds = true
        topView.layer.cornerRadius = 20
        topView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
//        topView.layer.shadowColor = UIColor.black.cgColor
//        topView.layer.shadowOpacity = 1
//        topView.layer.shadowOffset = .zero
//        topView.layer.shadowRadius = 50
//        topView.layer.shadowPath = UIBezierPath(rect: topView.bounds).cgPath
//        topView.layer.shouldRasterize = true
//        topView.layer.rasterizationScale = UIScreen.main.scale

        topView.layer.shadowColor = UIColor.black.cgColor
        topView.layer.shadowOffset = CGSize(width: 100, height: 100)
        topView.layer.shadowOpacity = 100
        topView.layer.shadowRadius = 100
        
//        let searchTextField = searchBar.value(forKey: "searchField") as? UITextField
//        searchTextField?.textColor = #colorLiteral(red: 0.520760715, green: 0.4224491119, blue: 1, alpha: 1)
//        searchTextField?.backgroundColor = #colorLiteral(red: 0.520760715, green: 0.4224491119, blue: 1, alpha: 1)
//        searchTextField?.attributedPlaceholder =  NSAttributedString(string: "     e.g appendicitis", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
//        searchBar.backgroundColor = #colorLiteral(red: 0.520760715, green: 0.4224491119, blue: 1, alpha: 1)
//        searchBar.searchBarStyle = .minimal
//        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .clear

        
        trackerView.layer.cornerRadius = 24
        trackerView.layer.shadowColor = UIColor.black.cgColor
        trackerView.layer.shadowOffset = CGSize(width: 0, height: 10)
        trackerView.layer.shadowOpacity = 0.4
        trackerView.layer.shadowOffset = CGSize.zero
        trackerView.layer.shadowRadius = 5
   
        
        infoSlideView.layer.cornerRadius = 24
        infoSlideView.layer.shadowColor = UIColor.black.cgColor
        infoSlideView.layer.shadowOffset = CGSize(width: 0, height: 10)
        infoSlideView.layer.shadowOpacity = 0.4
        infoSlideView.layer.shadowOffset = CGSize.zero
        infoSlideView.layer.shadowRadius = 5
    }
    
    
    
    
    private func dailySetUp(name: String)  {
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .none
        let dateArr = formatter.string(from: date).components(separatedBy: " ")
        let timeStrings = dateArr[0].components(separatedBy: ":")
        let timeInts = timeStrings.map { return Int($0) }
        switch dateArr[1] {
        case "AM":
            guard let hour = timeInts[0] else { return }
            if hour < 3 || hour == 12 {
                greetingLabel.text = "Good Evening \(name)!"
            } else {
                greetingLabel.text = "Good Morning! \(name)!"
                dayStatusIcon.image = UIImage.init(named: "morning")
            }
            
        case "PM":
            guard let hour = timeInts[0] else { return }
            if hour > 5 && hour != 12 {
                greetingLabel.text = "Good Evening \(name)!"
                dayStatusIcon.image = UIImage(named: "evening")
            } else {
                greetingLabel.text = "Good Afternoon \(name)!"
                
            }
        default:
            print("welp")
        }
    }
}

