//
//  NameCardUIView.swift
//  MedicalApp
//
//  Created by Pursuit on 8/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NameCardUIView: UIView,UITextFieldDelegate {
    
    var nameDefaultPlaceholder = "Name"

    @IBOutlet var nameView: UIView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        nameTextField.becomeFirstResponder()
        nameTextField.delegate = self
        nameTextField.text = nameDefaultPlaceholder
        nameTextField.textColor = .lightGray

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        nameTextField.delegate = self
        nameTextField.text = nameDefaultPlaceholder
        nameTextField.textColor = .lightGray
    }
    private func commonInit(){

        Bundle.main.loadNibNamed("nameUIView", owner: self, options: nil)
        addSubview(nameView)
        nameView.frame = bounds
        nameView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        nameTextField.borderStyle = .none
        nameTextField.layoutIfNeeded()
        
        
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: nameTextField.frame.size.height - width, width:  nameTextField.frame.size.width, height: nameTextField.frame.size.height)
        border.borderWidth = width
        nameTextField.layer.addSublayer(border)
        nameTextField.layer.masksToBounds = true
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if nameTextField.text == nameDefaultPlaceholder {
            textField.text = ""
            textField.textColor = .black
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            if textField == nameTextField {
                if textField == nameTextField {
                    textField.text = nameDefaultPlaceholder
                    textField.textColor = .black
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
  }
