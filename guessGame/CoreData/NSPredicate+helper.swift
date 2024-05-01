//
//  NSPredicate+helper.swift
//  guessGame
//
//  Created by Даниил Фомин on 29/04/2024.
//

import Foundation

extension NSPredicate {
    
    static let all = NSPredicate(format: "TRUEPREDICATE")
    static let none = NSPredicate(format: "FALSEPREDICATE")

}
