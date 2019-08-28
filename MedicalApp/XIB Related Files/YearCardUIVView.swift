//
//  YearCardUIVView.swift
//  MedicalApp
//
//  Created by Pursuit on 8/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class YearCardUIVView: UIView,UIPickerViewDataSource,UIPickerViewDelegate{
    
    
    @IBOutlet var yearView: UIView!
    
    @IBOutlet weak var yearTextView: UITextField!
  
    @IBOutlet weak var yearPicker: UIPickerView!
    
    @IBOutlet weak var yearButton: UIButton!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBAction func dismissYearPicker(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseIn, animations: {
            self.yearPicker.transform = CGAffineTransform(translationX: 0, y: 80)
            self.yearPicker.alpha = 0
            
            self.doneButton.transform = CGAffineTransform(translationX: 0, y: 80)
            self.doneButton.alpha = 0
        }, completion: nil)
    }
    @IBAction func yearButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseIn, animations: {
            self.yearPicker.transform = CGAffineTransform(translationX: 0, y: 0)
            self.yearPicker.alpha = 1
            
            self.doneButton.transform = CGAffineTransform(translationX: 0, y: 0)
            self.doneButton.alpha = 1
        }, completion: nil)
        
    }
    
    
    var selectedYear:String?
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
//        createToolBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
//        createToolBar()
        
        yearPicker.dataSource = self
        yearPicker.delegate = self
        
        yearPicker.transform = CGAffineTransform(translationX: 0, y: 70)
        doneButton.transform = CGAffineTransform(translationX: 0, y: 70)
        
//        let toolBar = UIToolbar()
//        toolBar.barStyle = UIBarStyle.default
//        toolBar.isTranslucent = true
//        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
//        toolBar.sizeToFit()
//
//        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(thing))
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(thing))
//
//        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
//        toolBar.isUserInteractionEnabled = true
//        yearTextView.inputAccessoryView = toolBar
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("yearUIView", owner: self, options: nil)
        addSubview(yearView)
        yearView.frame = bounds
        yearView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        
        yearTextView.borderStyle = .none
        yearTextView.layoutIfNeeded()
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.blue.cgColor
        border.frame = CGRect(x: 0, y: yearTextView.frame.size.height + width, width:  yearTextView.frame.size.width, height: yearTextView.frame.size.height)
        border.borderWidth = width
        yearTextView.layer.addSublayer(border)
        yearTextView.layer.masksToBounds = true
        
    }
    
    
    @objc func thing(){
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let currentDate = Date()
        let calender = Calendar.current
        let year = calender.component(.year, from: currentDate)
        let yearArray = Array((year-130)...year)
        return yearArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let currentDate = Date()
        let calender = Calendar.current
        let year = calender.component(.year, from: currentDate)
        let yearArray = Array((year-130)...year)
        return "\(yearArray.reversed()[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentDate = Date()
        let calender = Calendar.current
        let year = calender.component(.year, from: currentDate)
        let yearArray = Array((year-130)...year)
        
        selectedYear = "\(yearArray.reversed()[row])"
        yearTextView.text = selectedYear
    }
    
}
