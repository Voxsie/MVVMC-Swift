//
//  ViewController.swift
//  MVVMC
//
//  Created by Илья on 10.08.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    var coordinator: AppCoordinator?
    var viewModel: LoginViewModel?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login Screen"
        label.font = UIFont.boldSystemFont(ofSize: 24 )
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "dfserdtfyjgkhljgfds"
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        let txtFld = UITextField()
        txtFld.translatesAutoresizingMaskIntoConstraints = false
        txtFld.placeholder = "Введите логин"
        txtFld.font = .boldSystemFont(ofSize: 16)
        txtFld.sizeToFit()
        txtFld.layer.borderWidth = 1
        txtFld.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1).cgColor
        txtFld.layer.cornerRadius = 10
        txtFld.borderStyle = .roundedRect
        return txtFld
    }()
    
    lazy var passwordTextField: UITextField = {
        let txtFld = UITextField()
        txtFld.translatesAutoresizingMaskIntoConstraints = false
        txtFld.placeholder = "Введите пароль"
        txtFld.font = .boldSystemFont(ofSize: 16)
        txtFld.sizeToFit()
        txtFld.isSecureTextEntry = true
        txtFld.layer.borderWidth = 1
        txtFld.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1).cgColor
        txtFld.layer.cornerRadius = 10
        txtFld.borderStyle = .roundedRect
        return txtFld
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        return button
    }()
    
    func setupConstraints() {
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(loginTextField)
        loginTextField.topAnchor.constraint(equalTo: (titleLabel).topAnchor, constant: 100).isActive = true
        loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: (loginTextField).topAnchor, constant: 100).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: (passwordTextField).topAnchor, constant: 100).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(statusLabel)
        statusLabel.topAnchor.constraint(equalTo: (loginButton).topAnchor, constant: 100).isActive = true
        statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupConstraints()
    }
    
    
    
    func bindViewModel() {
        viewModel!.statusText.bind( {(statusText) in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        })
        viewModel!.statusColor.bind { (status) in
            DispatchQueue.main.async {
                self.statusLabel.textColor = status
            }
        }
        viewModel!.statusTextSize.bind { size in
            DispatchQueue.main.async {
                self.statusLabel.font = .systemFont(ofSize: CGFloat(size))
            }
        }
    }
    
    @objc func didButton() {
        viewModel!.userButtonPressed(login: loginTextField.text ?? "", password: passwordTextField.text ?? "")
        if viewModel!.isLoggedIn {
            coordinator?.isLoggedIn = ((viewModel?.isLoggedIn) != nil)
            coordinator?.showMain(login: loginTextField.text ?? "")
        }
    }
}

extension LoginViewController: Storyboardable {
    
}

