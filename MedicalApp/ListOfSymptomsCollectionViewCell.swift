//
//  ListOfSymptomsCollectionViewCell.swift
//  MedicalApp
//
//  Created by Pursuit on 9/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ListOfSymptomsCollectionViewCell: UICollectionViewCell {
    
    lazy var symptomLabel: UILabel = {
    var label = UILabel()
    label.text = "headache"
//    label.tintColor = .red
//    label.backgroundColor = .yellow
    label.textColor = .white
    label.numberOfLines = 0
    label.sizeToFit()
    label.font = label.font.withSize(20)
    return label
    }()
    
    lazy var deleteSymptomButton: UIButton = {
    var button = UIButton()
    button.setImage(UIImage.init(named: "delete-button-png-3"), for: .normal)
//    button.imageView?.layer.cornerRadius = button.frame.size.height/2
//    button.layer.cornerRadius = button.frame.size.height/2
    button.layer.masksToBounds = true
    button.layer.borderWidth = 0
    return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        CollectionCellSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init")
    }
    
    
    func CollectionCellSetup() {
        contentView.addSubview(symptomLabel)
        symptomLabel.translatesAutoresizingMaskIntoConstraints = false
        symptomLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        symptomLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        symptomLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        
        contentView.addSubview(deleteSymptomButton)
        deleteSymptomButton.translatesAutoresizingMaskIntoConstraints = false
        deleteSymptomButton.leadingAnchor.constraint(equalTo: symptomLabel.trailingAnchor, constant: 5).isActive = true
        deleteSymptomButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        deleteSymptomButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        deleteSymptomButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        deleteSymptomButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6).isActive = true
       deleteSymptomButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
       
    }
}

