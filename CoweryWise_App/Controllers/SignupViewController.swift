//
//  SignupViewController.swift
//  CoweryWise_App
//
//  Created by David U. Okonkwo on 9/29/20.
//

import UIKit

class SignupViewController: UIViewController {
    
    let titleView: UILabel = {
        let titleViewText = UILabel()
        titleViewText.text = StringsConstants.signUpTitleText
        titleViewText.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.semibold)
        titleViewText.textColor = .black
        return titleViewText
    }()
    let subTitleView: UILabel = {
        let subTitleViewText = UILabel()
        subTitleViewText.text = StringsConstants.signUpSubTitleText
        subTitleViewText.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        subTitleViewText.textColor = .lightGray
        return subTitleViewText
    }()
    
    lazy var continueButton: UIButton = {
        let continueButton = UIButton(type: .system)
        continueButton.backgroundColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        continueButton.titleLabel?.font = continueButton.titleLabel?.font.withSize(18)
        continueButton.setTitle(StringsConstants.continueButton, for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 5
        continueButton.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
        return continueButton
    }()
    
    @objc private  func handleContinue() {
        let locationViewController =  SetUserNameViewController()
        navigationController?.pushViewController(locationViewController, animated: true)
    }
    
    let inviteCodeTextView: UILabel = {
        let subTitleViewText = UILabel()
        subTitleViewText.text = StringsConstants.signUpInviteText
        subTitleViewText.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        subTitleViewText.textColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        return subTitleViewText
    }()
    
    
    
    
    
    let detailsStackView: UIStackView = {
        let detailsStackView = UIStackView()
        detailsStackView.axis = .vertical
        detailsStackView.alignment = .top
        detailsStackView.distribution = .fillEqually
        detailsStackView.spacing = 40
           
        let firstAndLastNameStackView: UIStackView = {
            let firstAndLastNameStackView = UIStackView()
            firstAndLastNameStackView.alignment = .leading
            firstAndLastNameStackView.axis = .horizontal
            firstAndLastNameStackView.distribution = .fillEqually
            firstAndLastNameStackView.spacing = 26
            
            let firstNameTextField: UITextField = {
                let textField = UITextField()
                textField.placeholder = StringsConstants.firstNamePlaceHolder
                var bottomLine = CALayer()
                bottomLine.frame = CGRect(x: 0.0, y: 40 - 1, width: 172, height: 1.0)
                bottomLine.backgroundColor = UIColor.lightGray.cgColor
                textField.borderStyle = UITextField.BorderStyle.none
                
                textField.layer.addSublayer(bottomLine)
                return textField
            }()
            let lastNameTextField: UITextField = {
                let textField = UITextField()
                textField.placeholder = StringsConstants.lastNamePlaceHolder
                var bottomLine = CALayer()
                bottomLine.frame = CGRect(x: 0, y: 40 - 1, width: 172, height: 1.0)
                bottomLine.backgroundColor = UIColor.lightGray.cgColor
                textField.borderStyle = UITextField.BorderStyle.none
                textField.layer.addSublayer(bottomLine)
                return textField
            }()
               
            firstAndLastNameStackView.addArrangedSubview(firstNameTextField)
            firstAndLastNameStackView.addArrangedSubview(lastNameTextField)
               
            return firstAndLastNameStackView
        }()
        let emailTextField: UITextField = {
            let textField = UITextField()
            var bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: 40 - 1, width: 344, height: 1.0)
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
            bottomLine.frame = CGRect(x: 0, y: 40 - 1, width: 344, height: 1.0)
            bottomLine.backgroundColor = UIColor.lightGray.cgColor
            textField.borderStyle = UITextField.BorderStyle.none
            textField.layer.addSublayer(bottomLine)
            textField.isSecureTextEntry = true
            return textField
        }()
        let phoneNumberTextField: UITextField = {
            let textField = UITextField()
            var bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: 40 - 1, width: 344, height: 1.0)
            bottomLine.backgroundColor = UIColor.lightGray.cgColor
            textField.borderStyle = UITextField.BorderStyle.none
            textField.layer.addSublayer(bottomLine)
            let attributes = [
                NSAttributedString.Key.foregroundColor: UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1),
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)
            ]
            textField.attributedPlaceholder = NSAttributedString(string: StringsConstants.phoneNumberPlaceHolder,
                                                                 attributes: attributes as [NSAttributedString.Key : Any])
            textField.keyboardType = .phonePad
            return textField
        }()
           detailsStackView.addArrangedSubview(firstAndLastNameStackView)
           detailsStackView.addArrangedSubview(emailTextField)
           detailsStackView.addArrangedSubview(passwordTextField)
           detailsStackView.addArrangedSubview(phoneNumberTextField)
           
           firstAndLastNameStackView.anchorWithConstantsToTop(nil, left: detailsStackView.leftAnchor, bottom: nil, right: detailsStackView.rightAnchor, rightConstant: 16)
           
           _ = emailTextField.anchor(nil, left: detailsStackView.leftAnchor, bottom: nil, right: detailsStackView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
           _ = passwordTextField.anchor(nil, left: detailsStackView.leftAnchor, bottom: nil, right: detailsStackView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
           _ = phoneNumberTextField.anchor(nil, left: detailsStackView.leftAnchor, bottom: nil, right: detailsStackView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
           return detailsStackView
       }()
    
    func cancelButton(){
        let closeIcon = UIBarButtonItem(title: StringsConstants.cancelButtonIcon, style: .plain, target: self, action: #selector(goToHome))
        navigationItem.leftBarButtonItem = closeIcon
        closeIcon.tintColor = .black
        closeIcon.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: StringsConstants.georgiaBoldFont, size: 50.0)!], for: UIControl.State.normal)
        closeIcon.setTitlePositionAdjustment(UIOffset(horizontal: 0.0, vertical: 5.0), for: UIBarMetrics.default)
    }
    
    @objc func goToHome(){
        self.dismiss(animated: true, completion: nil)
    }
    
    let termsAndConditionsTitleView: UILabel = {
        let termsAndConditionsText = UILabel()
        termsAndConditionsText.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        termsAndConditionsText.textColor = .lightGray
        termsAndConditionsText.text = StringsConstants.signUpTandCText
        termsAndConditionsText.underlineMyText(range1: StringsConstants.tandCRange1, range2: StringsConstants.tandCRange2 )
        return termsAndConditionsText
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleView)
        view.addSubview(subTitleView)
        view.addSubview(detailsStackView)
        view.addSubview(continueButton)
        view.addSubview(inviteCodeTextView)
        view.addSubview(termsAndConditionsTitleView)
        cancelButton()
        view.backgroundColor = .white
        
        _ = titleView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 120, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        _ = subTitleView.anchor(titleView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 9, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        
        _ = detailsStackView.anchor(subTitleView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 60, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
        _ = continueButton.anchor(detailsStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 70, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 55)
        _ = inviteCodeTextView.anchor(continueButton.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 100, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        inviteCodeTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        _ = termsAndConditionsTitleView.anchor(inviteCodeTextView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 30, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
        
    }
}
