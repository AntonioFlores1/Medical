//
//  emialCardUIView.swift
//  MedicalApp
//
//  Created by Pursuit on 8/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class emialCardUIView: UIView,UITextFieldDelegate {
    
    @IBOutlet var emailView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        emailTextField.delegate = self
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("emailUIView", owner: self, options: nil)
        addSubview(emailView)
        emailView.frame = bounds
        emailView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        
        emailTextField.borderStyle = .none
        emailTextField.layoutIfNeeded()
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: emailTextField.frame.size.height - width+10, width:  emailTextField.frame.size.width, height: emailTextField.frame.size.height)
        border.borderWidth = width
        emailTextField.layer.addSublayer(border)
        emailTextField.layer.masksToBounds = true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
