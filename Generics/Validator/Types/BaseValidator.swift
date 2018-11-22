//
//  BaseValidator.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

class BaseValidator<Value, Rule>: Validator where Rule: BaseValidationRule<Value> {
    
    // MARK: - Properties
    
    var value: Value
    var rules: [Rule]
    
    
    // MARK: - Initialization
    
    required init(value: Value, rules: [Rule]) {
        self.value = value
        self.rules = rules
    }
    
    
    // MARK: - Appearance
    
    func validate() -> ValidationResult {
        for rule in rules {
            let result = rule.validate(value: value)
            
            if !result.value {
                return result
            }
        }
        
        return .valid
    }
    
}
