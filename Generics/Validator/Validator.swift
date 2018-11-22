//
//  Validator.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

//EmailAddressValidator("").validate()
//PasswordValidator("").validate()
//AgeValidator(3).validate()

protocol Validator {
    
    // MARK: - Types
    
    associatedtype Value
    associatedtype Rule: BaseValidationRule<Value>
    
    
    // MARK: - Properties
    
    var value: Value { get }
    var rules: [Rule] { get }
    
    
    // MARK: - Initialization
    
    init(value: Value, rules: [Rule])
    
    
    // MARK: - Appearance
    
    func validate() -> ValidationResult
    
}
