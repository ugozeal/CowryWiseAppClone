//
//  SetUserNameViewController.swift
//  CoweryWise_App
//
//  Created by David U. Okonkwo on 9/29/20.
//

import UIKit

class SetUserNameViewController: UIViewController {
     
    
    
    func backButton(){
        let leftIcon = UIBarButtonItem(title: StringsConstants.backButtonIcon , style: .plain, target: self, action: #selector(backToSignUp))
        navigationItem.leftBarButtonItem = leftIcon
        leftIcon.tintColor = .black
        leftIcon.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: StringsConstants.georgiaBoldFont, size: 40.0)!], for: UIControl.State.normal)
        leftIcon.setTitlePositionAdjustment(UIOffset(horizontal: 0.0, vertical: 5.0), for: UIBarMetrics.default)
    }
    @objc private func backToSignUp(sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    let titleView: UILabel = {
        let titleViewText = UILabel()
        titleViewText.text = StringsConstants.userNameTitleText
        titleViewText.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        titleViewText.textColor = .black
        return titleViewText
    }()
    let subTitleView: UILabel = {
        let subTitleViewText = UILabel()
        subTitleViewText.text = StringsConstants.userNameSubTitleText
        subTitleViewText.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        subTitleViewText.textColor = #colorLiteral(red: 0.315443933, green: 0.3746806979, blue: 0.4743874669, alpha: 1)
        subTitleViewText.lineBreakMode = .byWordWrapping
        subTitleViewText.numberOfLines = 0
        return subTitleViewText
    }()
    
    let userNameTextField: UITextField = {
        let textField = UITextField()
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 50 - 1, width: 380, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        let color = #colorLiteral(red: 0.4243866801, green: 0.5075187087, blue: 0.6363344193, alpha: 1);
        let attributes = [
        
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "@",
                                                             attributes: attributes as [NSAttributedString.Key : Any])
        textField.keyboardType = .namePhonePad
        return textField
    }()
    
    let secondSubTitleView: UILabel = {
        let subTitleViewText = UILabel()
        subTitleViewText.text = StringsConstants.userNameSecondSubTitleText
        subTitleViewText.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        subTitleViewText.textColor = #colorLiteral(red: 0.2992200553, green: 0.6313085556, blue: 0.9966560006, alpha: 1)
        subTitleViewText.lineBreakMode = .byWordWrapping
        subTitleViewText.numberOfLines = 0
        return subTitleViewText
    }()
    
    let detailsStackView: UIStackView = {
        let detailsStackView = UIStackView()
        detailsStackView.axis = .vertical
        detailsStackView.alignment = .top
        detailsStackView.spacing = 20
           
        let firstStackView: UIStackView = {
            let firstStackView = UIStackView()
            firstStackView.alignment = .leading
            firstStackView.axis = .horizontal
            firstStackView.distribution = .fillProportionally
            firstStackView.spacing = 5
            
            let tickMark: UILabel = {
                let tick = UILabel()
                tick.text = StringsConstants.tick
                tick.textColor = #colorLiteral(red: 0.001293938141, green: 0.3973664641, blue: 0.959946692, alpha: 1)
                tick.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
                return tick
            }()
            let textField: UILabel = {
                let textField = UILabel()
                textField.text = StringsConstants.userNameStackViewText1
                textField.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
                textField.textColor = #colorLiteral(red: 0.315443933, green: 0.3746806979, blue: 0.4743874669, alpha: 1)
                textField.lineBreakMode = .byWordWrapping
                textField.numberOfLines = 0
                return textField
            }()
               
            firstStackView.addArrangedSubview(tickMark)
            firstStackView.addArrangedSubview(textField)
               
            return firstStackView
        }()
        let secondStackView: UIStackView = {
            let secondStackView = UIStackView()
            secondStackView.alignment = .leading
            secondStackView.axis = .horizontal
            secondStackView.distribution = .fillProportionally
            secondStackView.spacing = 5
            
            let tickMark: UILabel = {
                let tick = UILabel()
                tick.text = StringsConstants.tick
                tick.textColor = #colorLiteral(red: 0.001293938141, green: 0.3973664641, blue: 0.959946692, alpha: 1)
                tick.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
                return tick
            }()
            let textField: UILabel = {
                let textField = UILabel()
                textField.text = StringsConstants.userNameStackViewText2
                textField.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
                textField.textColor = #colorLiteral(red: 0.315443933, green: 0.3746806979, blue: 0.4743874669, alpha: 1)
                textField.lineBreakMode = .byWordWrapping
                textField.numberOfLines = 0
                return textField
            }()
               
            secondStackView.addArrangedSubview(tickMark)
            secondStackView.addArrangedSubview(textField)
               
            return secondStackView
        }()
           detailsStackView.addArrangedSubview(firstStackView)
           detailsStackView.addArrangedSubview(secondStackView)
           
        firstStackView.anchorWithConstantsToTop(nil, left: detailsStackView.leftAnchor, bottom: nil, right: detailsStackView.rightAnchor, rightConstant: 16)
        secondStackView.anchorWithConstantsToTop(nil, left: detailsStackView.leftAnchor, bottom: nil, right: detailsStackView.rightAnchor, rightConstant: 16)

        return detailsStackView
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
        let locationViewController =  ConfirmationViewController()
        navigationController?.pushViewController(locationViewController, animated: true)
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleView)
        view.addSubview(subTitleView)
        view.addSubview(userNameTextField)
        view.addSubview(secondSubTitleView)
        view.addSubview(detailsStackView)
        view.addSubview(continueButton)
        backButton()
        
        
        
        
        
        _ = titleView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 120, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        _ = subTitleView.anchor(titleView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 11, leftConstant: 20, bottomConstant: 0, rightConstant: 0)
        _ = userNameTextField.anchor(subTitleView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 38, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        _ = secondSubTitleView.anchor(userNameTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 25, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        _ = detailsStackView.anchor(secondSubTitleView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        _ = continueButton.anchor(view.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, leftConstant: 16, bottomConstant: 60, rightConstant: 16, heightConstant: 55)
    }
      
}
