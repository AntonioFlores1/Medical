//
//  AccountViewController.swift
//  MedicalApp
//
//  Created by Pursuit on 8/23/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var viewDesign: UIView!
    
    @IBOutlet weak var accountViewCard: UIView!
    
    @IBOutlet weak var accountPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.isTranslucent = true
        navigationController?.isNavigationBarHidden = true
        
        viewDesign.clipsToBounds = true
        viewDesign.layer.cornerRadius = 18
        viewDesign.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
//        accountViewCard.clipsToBounds = true
//        accountViewCard.layer.cornerRadius = 24
//        accountViewCard.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner,.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        
        accountPhoto.layer.cornerRadius = accountPhoto.frame.size.width/2
        accountPhoto.layer.masksToBounds = true
        accountPhoto.layer.borderWidth = 0
        
//        accountViewCard.layer.shadowColor = UIColor.black.cgColor
//        accountViewCard.layer.shadowOpacity = 1
//        accountViewCard.layer.shadowOffset = .zero
//        accountViewCard.layer.shadowRadius = 10
    
        
        accountViewCard.layer.cornerRadius = 24
        accountViewCard.layer.shadowColor = UIColor.black.cgColor
        accountViewCard.layer.shadowOffset = CGSize(width: 0, height: 10)
        accountViewCard.layer.shadowOpacity = 0.4
        accountViewCard.layer.shadowOffset = CGSize.zero
        accountViewCard.layer.shadowRadius = 5
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
