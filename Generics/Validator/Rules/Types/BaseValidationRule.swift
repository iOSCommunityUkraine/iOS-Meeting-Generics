//
//  BaseValidationRule.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

class BaseValidationRule<Value>: ValidationRule {
    
    // MARK: - Properties
    
    let error: ValidationError
    
    
    // MARK: - Initialization
    
    init(error: ValidationError) {
        self.error = error
    }
    
    
    // MARK: - Appearance
    
    func validate(value: Value) -> ValidationResult {
        fatalError("Please implement in child classes.")
    }
}
