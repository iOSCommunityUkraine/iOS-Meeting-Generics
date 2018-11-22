//
//  EmptyStringValidationRule.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

final class EmptyStringValidationRule: BaseValidationRule<String> {
    override func validate(value: String) -> ValidationResult {
        guard !value.isEmpty else {
            return .invalid(error)
        }
        
        return .valid
    }
}
