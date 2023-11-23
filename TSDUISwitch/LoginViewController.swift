//
//  ViewController.swift
//  TSDUISwitch
//
//  Created by admin on 10.10.2023.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: Private properties
    
    private let cloudImage = UIImageView()
    private let cloudLabel = UILabel()
    
    private let signInLabel = UILabel()
    
    private let emailLabel = UILabel()
    private let emailTextField = TextFieldWithPadding()
    
    private let passwordLabel = UILabel()
    private let passwordTextField = TextFieldWithPadding()
    
    private let signInButton = UIButton()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        hideKeyboardOnTap()
    }
}

private extension LoginViewController {
    
    // MARK: Init Interface function
    
    func initialize() {
        view.backgroundColor = .systemBackground
        
        // MARK: Cloud Image
        
        cloudImage.contentMode = .scaleAspectFit
        cloudImage.image = UIImage(systemName: "cloud.fill")
        guard let navBarFrameSize = navigationController?.navigationBar.frame.height else { return }
        view.addSubview(cloudImage)
        cloudImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(navBarFrameSize + 50)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        // MARK: Cloud Label
        
        cloudLabel.contentMode = .center
        cloudLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        cloudLabel.text = "Company Label"
        cloudLabel.textColor = .systemPink
        view.addSubview(cloudLabel)
        
        cloudLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cloudImage.snp.bottom)
        }
        
        // MARK: SignIn Label
        
        signInLabel.contentMode = .center
        signInLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        signInLabel.text = "Sign In"
        view.addSubview(signInLabel)
        
        signInLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.top.equalTo(cloudLabel.snp.bottom).offset(40)
        }
        
        // MARK: Email Label
        
        emailLabel.contentMode = .center
        emailLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        emailLabel.text = "Email"
        emailLabel.textColor = .systemPink
        view.addSubview(emailLabel)
        
        emailLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.top.equalTo(signInLabel.snp.bottom).offset(5)
        }
        
        // MARK: Email UITextField
        
        emailTextField.keyboardType = .emailAddress
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.returnKeyType = .done
        emailTextField.layer.cornerRadius = 8
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor.systemRed.cgColor
        
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(40)
            make.top.equalTo(emailLabel.snp.bottom).offset(5)
            make.height.equalTo(36)
        }
        emailTextField.addTarget(self, action: #selector(textFieldDidEndEditing(sender: )), for: .editingDidEndOnExit)
        
        // MARK: Password Label
        
        passwordLabel.contentMode = .center
        passwordLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        passwordLabel.text = "Passsword"
        passwordLabel.textColor = .systemPink
        view.addSubview(passwordLabel)
        
        passwordLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
        }
        
        // MARK: Password TextField
        
        passwordTextField.keyboardType = .default
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .done
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.systemPink.cgColor
        passwordTextField.addTarget(self, action: #selector(textFieldDidEndEditing(sender: )), for: .editingDidEndOnExit)
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(40)
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.height.equalTo(36)
        }
        
        // MARK: SignIn Button
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = .systemPink
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        signInButton.layer.cornerRadius = 16
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(60)
            make.height.equalTo(60)
            make.top.equalTo(passwordTextField.snp.bottom).offset(80)
        }
    }
    
    @objc private func signInButtonTapped() {
        let settingsViewController = SettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
}

