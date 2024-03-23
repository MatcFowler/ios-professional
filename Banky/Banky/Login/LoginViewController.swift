//
//  ViewController.swift
//  Banky
//
//  Created by Admin on 1/26/24.
//

import UIKit

protocol LogoutDelegate:AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}


class LoginViewController: UIViewController {
    let loginTitleTextView = UILabel()
    let loginIntroTextView = UILabel()
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate:LoginViewControllerDelegate?
    
    
    var username: String? {
        return loginView.userTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}
    
    extension LoginViewController {
        
        private func style(){
            
            loginTitleTextView.translatesAutoresizingMaskIntoConstraints = false
            loginTitleTextView.text = "Bankey"
            loginTitleTextView.textAlignment = .center
            
            
            
            loginIntroTextView.translatesAutoresizingMaskIntoConstraints = false
            loginIntroTextView.text = "Your Premium Source For All Things Banking!"
            loginIntroTextView.textAlignment = .center
            loginIntroTextView.numberOfLines = 2
            
            
            loginView.translatesAutoresizingMaskIntoConstraints = false
            
            signInButton.translatesAutoresizingMaskIntoConstraints = false
            signInButton.configuration = .filled()
            signInButton.configuration?.imagePadding = 8
            signInButton.setTitle("Sign In", for: [])
            signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
            
            errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
            errorMessageLabel.textAlignment = .center
            errorMessageLabel.textColor = .systemRed
            errorMessageLabel.numberOfLines = 0
            errorMessageLabel.isHidden = true
        }
        
        private func layout(){
            view.addSubview(loginTitleTextView)
            view.addSubview(loginIntroTextView)
            view.addSubview(loginView)
            view.addSubview(signInButton)
            view.addSubview(errorMessageLabel)
            
            
            
            NSLayoutConstraint.activate([
                loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                view.trailingAnchor.constraint(equalToSystemSpacingAfter:loginView.trailingAnchor, multiplier: 1)
            ])
            
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
                signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
                signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            ])
            NSLayoutConstraint.activate([
                errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
                errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
                errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            ])       
            NSLayoutConstraint.activate([
                loginTitleTextView.bottomAnchor.constraint(equalToSystemSpacingBelow: loginView.topAnchor, multiplier: 2),
                loginTitleTextView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
                loginTitleTextView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            ])
            
            NSLayoutConstraint.activate([
                loginIntroTextView.topAnchor.constraint(equalToSystemSpacingBelow: loginView.topAnchor, multiplier: 2),
                loginIntroTextView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
                loginIntroTextView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            ])}
        }


extension LoginViewController {
    
    @objc func signInTapped (sender:UIButton){
        
        errorMessageLabel.isHidden = true
        
        login()
    }
    
    private func login(){
        guard let username = username, let password = password else{
            assertionFailure("Username / Password should never be null")
            return
        }
        
        if username.isEmpty || password.isEmpty{
            configureView(withMessage: "Username / Password Cannot Be Blank")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        }else{
            configureView(withMessage: "Incorrect Username / Password")
            return
        }
        
        
    }
    
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
}
