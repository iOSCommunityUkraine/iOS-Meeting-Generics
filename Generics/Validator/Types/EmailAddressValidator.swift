//
//  EmailAddressValidator.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

final class EmailAddressValidator: BaseValidator<String, BaseValidationRule<String>> {
    
    // MARK: - Types
    
    enum Error: ValidationError {
        case empty, wrong
        
        var errorDescription: String? {
            switch self {
            case .empty:
                return "Empty email address"
            case .wrong:
                return "Wrong email address"
            }
        }
    }
    
    // MARK: - Initialization
    
    required init(value: Value, rules: [Rule] = [
        EmptyStringValidationRule(error: Error.empty),
        EmailAddressValidationRule(error: Error.wrong)
    ]) {
        super.init(value: value, rules: rules)
    }
}
