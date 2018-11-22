//
//  ValidationRule.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

protocol ValidationRule {
    
    // MARK: - Types
    
    associatedtype Value
    
    
    // MARK: - Appearance
    
    func validate(value: Value) -> ValidationResult
}
