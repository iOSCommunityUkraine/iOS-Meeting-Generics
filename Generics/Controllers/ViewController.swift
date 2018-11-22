//
//  ViewController.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import UIKit

//final class LogInViewController: UIViewController {
//    @IBOutlet private weak var emailAddressTextField: UITextField?
//    @IBOutlet private weak var passwordTextField: UITextField!
//    
//    
//    
//    @IBAction
//    func logInButtonTouchedUpInside(_ sender: UIButton) {
//        let emailValidator = EmailAddressValidator(value: emailAddressTextField?.text ?? "").validate()
//        let passwordValidator = PasswordValidator(value: passwordTextField.text ?? "").validate()
//        
//        let result = emailValidator + passwordValidator
//        
//        guard result.value else {
//            return print(result.error!.localizedDescription)
//        }
//        
////        logIn(email: emailAddressTextField!.text!, password: password)
//    }
//    
//    func logIn(email: String, password: String) {
////        Api.logIn
//    }
//}
//
//final class TestValidator {
//    enum Error: LocalizedError {
//        case empty,
//        wrong
//        
//        var errorDescription: String? {
//            switch self {
//            case .empty:
//                return "Email address cannot be empty."
//
//            case .wrong:
//                return "Invalid email address"
//            }
//        }
//    }
//
//    enum Result {
//        case valid
//        case invalid(Error)
//        
//        var value: Bool {
//            if case .valid = self {
//                return true
//            }
//
//            return false
//        }
//
//        var error: Error? {
//            if case .invalid(let error) = self {
//                return error
//            }
//            
//            return nil
//        }
//    }
//
//    static func isValidEmail(_ emailAddress: String) -> Result {
//        guard !emailAddress.isEmpty else {
//            return .invalid(Error.empty)
//        }
//
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//
//        guard emailTest.evaluate(with: emailAddress) else {
//            return .invalid(Error.wrong)
//        }
//        
//        return .valid
//    }
//}
