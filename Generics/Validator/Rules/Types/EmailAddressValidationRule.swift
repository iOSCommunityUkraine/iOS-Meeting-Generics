//
//  EmailAddressValidationRule.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

final class EmailAddressValidationRule: BaseValidationRule<String> {
    override func validate(value: String) -> ValidationResult {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        guard emailTest.evaluate(with: value) else {
            return .invalid(error)
        }
        
        return .valid
    }
}
