//
//  HumanSymptomsCollectionViewCell.swift
//  MedicalApp
//
//  Created by antonio  on 1/10/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//  symptoms

import UIKit

class HumanSymptomsCollectionViewCell: UICollectionViewCell {
    
    lazy var symptomsLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        label.font = UIFont(name: "Didot", size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        symptomsConstraints()
//        self.layer.cornerRadius = self.frame.size.height / 2

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    func symptomsConstraints() {
        addSubview(symptomsLabel)
        symptomsLabel.translatesAutoresizingMaskIntoConstraints = false
        symptomsLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: 0).isActive = true
        symptomsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: 0).isActive = true
        symptomsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        symptomsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 2).isActive = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.contentView.layer.cornerRadius = 90
    }
    
}
