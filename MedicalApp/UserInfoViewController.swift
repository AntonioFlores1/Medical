//
//  UserInfoViewController.swift
//  MedicalApp
//
//  Created by Pursuit on 8/20/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController{
    
    
    @IBOutlet weak var genderCardView: GenderCardUIView!
    
    @IBOutlet weak var nameCardView: NameCardUIView!
    
    @IBOutlet weak var yearCardView: YearCardUIVView!
    
    @IBOutlet weak var emailCardView: emialCardUIView!
    
    @IBOutlet weak var getToKnowYouLabel: UILabel!
    
    @IBOutlet weak var reasonWhyWeNeedMoreInfoLabl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenCardDefault()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.4, delay: 0.4, options: .curveEaseIn, animations: {
                self.getToKnowYouLabel.transform = CGAffineTransform.init(translationX: 0, y: -200)
                self.reasonWhyWeNeedMoreInfoLabl.transform = CGAffineTransform.init(translationX: 0, y: -200)
                self.reasonWhyWeNeedMoreInfoLabl.alpha = 1
                self.genderCardView.transform = CGAffineTransform.init(translationX: 0, y: 0)
            }, completion: nil)
        }
        genderAnimation()
        
        nameCardView.nameTextField.addTarget(self, action: #selector(userNameText), for: .editingDidEnd)
        
        yearCardView.doneButton.addTarget(self, action: #selector(transferToEmailCard), for: .touchUpInside)
        
        emailCardView.emailTextField.addTarget(self, action: #selector(emailSetUp), for: .editingDidEnd)
        
    }
    
    
    @objc func emailSetUp(){
        UIView.animate(withDuration: 0.5, delay: 0.8, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.emailCardView.transform = CGAffineTransform.init(translationX: -200, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.emailCardView.transform = CGAffineTransform.init(translationX: -300, y: -200)
                self.emailCardView.alpha = 0
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainPage = storyboard.instantiateViewController(withIdentifier: "mainPage") as! ViewController
                self.present(mainPage, animated: true, completion: nil)
            }, completion: nil)
        }
        print("did i work?")

    }
    
    
    @objc func transferToEmailCard(){
        UIView.animate(withDuration: 0.5, delay: 0.8, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.yearCardView.transform = CGAffineTransform.init(translationX: -200, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.yearCardView.transform = CGAffineTransform.init(translationX: -300, y: -200)
                self.yearCardView.alpha = 0
                self.emailCardView.transform = CGAffineTransform.init(translationX: 0, y: 0)
                    self.getToKnowYouLabel.text = "\n \n Final Step before you get started"
            }, completion: nil)
        }
    }
    
    @objc func userNameText(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.nameCardView.transform = CGAffineTransform.init(translationX: -200, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.nameCardView.transform = CGAffineTransform.init(translationX: -300, y: -200)
                self.nameCardView.alpha = 0
                self.yearCardView.transform = CGAffineTransform.init(translationX: 0, y: 0)
                if let name = self.nameCardView.nameTextField.text {
                    self.getToKnowYouLabel.text = "Hello \(name), \n it's a pleasure to meet you"
                    self.reasonWhyWeNeedMoreInfoLabl.alpha = 0
                }
            }, completion: nil)
        }
        print("my name jeff")
    }
   

    func genderAnimation(){
        genderCardView.femaleButton.addTarget(self, action: #selector(femaleChoice), for: .touchUpInside)
        genderCardView.maleButton.addTarget(self, action: #selector(maleChoice), for: .touchUpInside)
    }
    
    @objc func femaleChoice(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.genderCardView.transform = CGAffineTransform.init(translationX: -200, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.genderCardView.transform = CGAffineTransform.init(translationX: -300, y: -390)
                self.genderCardView.alpha = 0
                self.nameCardView.transform = CGAffineTransform.init(translationX: 0, y: 0)
                
            }, completion: nil)
        }
        print("Famale")
    }
    
    @objc func maleChoice(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.genderCardView.transform = CGAffineTransform.init(translationX: -200, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.genderCardView.transform = CGAffineTransform.init(translationX: -200, y: -390)
                self.genderCardView.alpha = 0
                self.nameCardView.transform = CGAffineTransform.init(translationX: 0, y: 0)
            }, completion: nil)
        }
        print("male")
    }
    
    
    func hiddenCardDefault(){
        genderCardView.transform = CGAffineTransform.init(translationX: 390, y: 0)
        nameCardView.transform = CGAffineTransform.init(translationX: 390, y: 0)
        yearCardView.transform = CGAffineTransform.init(translationX: 390, y: 0)
        emailCardView.transform = CGAffineTransform.init(translationX: 390, y: 0)
    }
    

}
    

