//
//  PasswordValidationRule.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

final class PasswordValidationRule: BaseValidationRule<String> {
    override func validate(value: String) -> ValidationResult {
        let emailRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        guard emailTest.evaluate(with: value) else {
            return .invalid(error)
        }
        
        return .valid
    }
}
