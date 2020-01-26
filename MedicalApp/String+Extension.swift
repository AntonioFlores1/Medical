//
//  String+Extension.swift
//  MedicalApp
//
//  Created by antonio  on 1/15/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation

extension String {
    
    func separate(every: Int, with separator: String) -> String {
        var myString = ""
        var counter = 0
        for i in self {
            
            if i == " " && counter != every  {
                counter += 1
                myString += " "
            } else {
                myString += i.description
            }
            
            if counter == every {
                myString += separator
                counter = 0
            }
        }
        
        return myString
    }
}
