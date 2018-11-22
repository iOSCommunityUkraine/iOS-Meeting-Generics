//
//  PasswordValidator.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

final class PasswordValidator: BaseValidator<String, BaseValidationRule<String>> {
    
    // MARK: - Types
    
    enum Error: ValidationError {
        case empty, wrong
        
        var errorDescription: String? {
            switch self {
            case .empty:
                return "Empty password address"
            case .wrong:
                return "Wrong password address"
            }
        }
    }
    
    // MARK: - Initialization
    
    required init(value: Value, rules: [Rule] = [
        EmptyStringValidationRule(error: Error.empty),
        PasswordValidationRule(error: Error.wrong)
    ]) {
        super.init(value: value, rules: rules)
    }
}
