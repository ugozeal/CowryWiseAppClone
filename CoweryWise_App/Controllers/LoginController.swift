//
//  HomeViewController.swift
//  CoweryWise_App
//
//  Created by David U. Okonkwo on 9/28/20.
//

import UIKit

class LoginController: UIViewController {
    
    let titleView: UILabel = {
        let titleViewText = UILabel()
        titleViewText.text = "Log In."
        titleViewText.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.semibold)
        titleViewText.textColor = .white
        return titleViewText
    }()
    
    
    let subTitleView: UILabel = {
        let subTitleViewText = UILabel()
        subTitleViewText.text = "It's a good day to save."
        subTitleViewText.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        subTitleViewText.textColor = .white
        return subTitleViewText
    }()
    
    @objc func goToHome(){
        self.dismiss(animated: true, completion: nil)
    }

    
    let emailTextField: UITextField = {
        let textField = UITextField()
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 50 - 1, width: 380, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1),
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: StringsConstants.emailPlaceHolder,
                                                             attributes: attributes as [NSAttributedString.Key : Any])
        textField.keyboardType = .emailAddress
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1),
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: StringsConstants.passwordPlaceHolder,
                                                             attributes: attributes as [NSAttributedString.Key : Any])
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 50 - 1, width: 380, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    func cancelButton(){
        let closeIcon = UIBarButtonItem(title: StringsConstants.cancelButtonIcon , style: .plain, target: self, action: #selector(goToHome))
        navigationItem.leftBarButtonItem = closeIcon
        closeIcon.tintColor = .white
        closeIcon.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 50.0)!], for: UIControl.State.normal)
        closeIcon.setTitlePositionAdjustment(UIOffset(horizontal: 0.0, vertical: 5.0), for: UIBarMetrics.default)
    }
    
    
    lazy var loginButton: UIButton = {
        let loginbutton = UIButton(type: .system)
        loginbutton.backgroundColor = .white
        loginbutton.titleLabel?.font = loginbutton.titleLabel?.font.withSize(18)
        loginbutton.setTitle("LOGIN", for: .normal)
        loginbutton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for: .normal)
        loginbutton.layer.cornerRadius = 5
        loginbutton.layer.borderColor = CGColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        loginbutton.layer.borderWidth = 1
        loginbutton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return loginbutton
    }()
    
    @objc private  func handleLogin() {
        let seguePath = WelcomePageViewController()
        let navController = UINavigationController(rootViewController: seguePath)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
    
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        
        
        let showPasswordView: UIButton = {
            let showPasswordText = UIButton()
            showPasswordText.setTitle("Show Password", for: .normal)
            showPasswordText.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
            showPasswordText.setTitleColor(.white, for: .normal)
            return showPasswordText
        }()
        
        let forgotPasswordView: UIButton = {
            let forgotPasswordText = UIButton()
            forgotPasswordText.setTitle("Forgot Password?", for: .normal)
            forgotPasswordText.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
            forgotPasswordText.setTitleColor(.white, for: .normal)
            return forgotPasswordText
        }()

        stackView.addArrangedSubview(showPasswordView)
        stackView.addArrangedSubview(forgotPasswordView)


        return stackView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleView)
        view.addSubview(subTitleView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(stackView)
        view.backgroundColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        cancelButton()
        
        
        
        

        _ = titleView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 120, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        _ = subTitleView.anchor(titleView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 9, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 30, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        _ = emailTextField.anchor(subTitleView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 100, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        _ = stackView.anchor(passwordTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        _ = loginButton.anchor(stackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 50, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 55)
        

    }
}


