//
//  ValidationResult.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

enum ValidationResult {
    case valid
    case invalid(ValidationError)
    
    var value: Bool {
        if case .valid = self {
            return true
        }
        
        return false
    }
    
    var error: ValidationError? {
        if case .invalid(let error) = self {
            return error
        }
        
        return nil
    }
    
    
    static func + (lhs: ValidationResult, rhs: ValidationResult) -> ValidationResult {
        return lhs.value ? rhs : lhs
    }
}
