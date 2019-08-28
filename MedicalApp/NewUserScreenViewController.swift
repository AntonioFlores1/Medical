//
//  NewUserViewController.swift
//  MedicalApp
//
//  Created by Pursuit on 8/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
import UIKit

class NewUserViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.isTranslucent = true
        navigationController?.isNavigationBarHidden = true
        
        let colorVersion1 = UIColor.init(displayP3Red: 29/255, green: 0/255, blue: 253/255, alpha: 1)
        
        let color1P = UIColor.init(displayP3Red: 17/255, green: 0/255, blue: 172/255, alpha: 1)
//        rgb(16,0,177)


        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [colorVersion1.cgColor,color1P.cgColor]
//        layer.startPoint = CGPoint(x: 0,y: 0)
//        layer.endPoint = CGPoint(x: 1,y: 1)
        view.layer.insertSublayer(layer, at: 0)
    }
    

}
