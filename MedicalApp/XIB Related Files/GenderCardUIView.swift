//
//  genderCardUIView.swift
//  MedicalApp
//
//  Created by Pursuit on 8/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GenderCardUIView: UIView {
    
    @IBOutlet var contentiew: UIView!
    
    @IBOutlet weak var maleButton: UIButton!
    
    @IBOutlet weak var femaleButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("UserSetUpInfo", owner: self, options: nil)
        addSubview(contentiew)
        contentiew.frame = bounds
        contentiew.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
    
    
}
