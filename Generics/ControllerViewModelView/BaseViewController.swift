//
//  BaseViewController.swift
//  Generics
//
//  Created by Andrew Kochulab on 11/21/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import UIKit

func test() {

//    guard let viewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
//        return
//    }
//
//    self.present(viewController)
    
    let view = Bundle.main.loadNibNamed(String(describing: LoginView.self), owner: nil, options: nil)!.first as! LoginView
    let viewModel = LoginViewModel()
    let viewController = LoginViewController(view: view, viewModel: viewModel)
//    self.present(viewController)
}

class BaseViewModel { }

class BaseView: UIView { }

class BaseViewController<View, ViewModel>: UIViewController where ViewModel: BaseViewModel, View: BaseView {
    let rootView: View
    let viewModel: ViewModel

    init(view: View,
         viewModel: ViewModel) {
        self.viewModel = viewModel
        self.rootView = view
        
        super.init(nibName: nil, bundle: nil)
        
        if self.nibBundle != Bundle.main {
            fatalError()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureViewModel()
    }
    
    func configureView() {
        
    }
    
    func configureViewModel() {
        
    }
    
}


final class LoginViewModel: BaseViewModel {
    
    var onError: ((ValidationError) -> Void)?
    
    var emailAddress: String
    var password: String
    
    init(emailAddress: String = "", password: String = "") {
        self.emailAddress = emailAddress
        self.password = password
    }
    
    func execute() {
        let result = validate()
        
        guard result.value else {
            onError?(result.error!)
            
            return
        }
        
        logIn()
    }
    
    func validate() -> ValidationResult {
        return .valid
    }
    
    private func logIn() {
//        API.request
    }
}

typealias EmptyHandler = () -> Void
typealias TextFieldHandler = (String) -> Void

final class LoginView: BaseView {
    var emailAddress: String {
        get {
            return emailAddressTextField?.text ?? ""
        }
        set {
            emailAddressTextField?.text = newValue
        }
    }
    
    var password: String {
        get {
            return passwordTextField?.text ?? ""
        }
        set {
            passwordTextField?.text = newValue
        }
    }
    
    var onSubmitTouchedUpInside: EmptyHandler?
    var onEmailChanged: TextFieldHandler?
    var onPasswordChanged: TextFieldHandler?
    
    
    @IBOutlet weak var emailAddressTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    @IBOutlet weak var submitButton: UIButton?
    

    @IBAction
    func submitButtonTouchedUpInside(_ sender: UIButton) {
        onSubmitTouchedUpInside?()
    }
    
    @IBAction
    func textFieldEditingChanged(_ sender: UITextField) {
        if sender === emailAddressTextField {
            onEmailChanged?(emailAddress)
        } else if sender == passwordTextField {
            onPasswordChanged?(password)
        }
    }
}

final class LoginViewController: BaseViewController<LoginView, LoginViewModel> {
    override func configureView() {
        super.configureView()
        
        rootView.onEmailChanged = { [unowned self] email in
            self.viewModel.emailAddress = email
        }
        
        rootView.onPasswordChanged = { [unowned self] password in
            self.viewModel.password = password
        }
        
        rootView.onSubmitTouchedUpInside = { [unowned self] in
            self.viewModel.execute()
        }
    }
    
    override func configureViewModel() {
        super.configureViewModel()
        
        viewModel.onError = { error in
            print(error.localizedDescription)
        }
    }
}
