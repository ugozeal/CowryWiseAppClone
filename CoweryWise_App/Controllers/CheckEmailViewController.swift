//
//  CheckEmailViewController.swift
//  CoweryWise_App
//
//  Created by David U. Okonkwo on 9/30/20.
//

import UIKit

class CheckEmailViewController: UIViewController {
    
    let titleView: UILabel = {
        let titleViewText = UILabel()
        titleViewText.text = StringsConstants.checkEmailTitleView
        titleViewText.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        titleViewText.textColor = .black
        return titleViewText
    }()
    let subTitleView: UILabel = {
        let subTitleViewText = UILabel()
        subTitleViewText.text = StringsConstants.checkEmailSubTitleView
        subTitleViewText.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.regular)
        subTitleViewText.textColor = #colorLiteral(red: 0.315443933, green: 0.3746806979, blue: 0.4743874669, alpha: 1)
        subTitleViewText.lineBreakMode = .byWordWrapping
        subTitleViewText.numberOfLines = 0
        return subTitleViewText
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
    
    lazy var verificationButton: UIButton = {
        let verificationButton = UIButton(type: .system)
        verificationButton.backgroundColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        verificationButton.titleLabel?.font = verificationButton.titleLabel?.font.withSize(18)
        verificationButton.setTitle("I HAVE VERIFIED MY EMAIL", for: .normal)
        verificationButton.setTitleColor(.white, for: .normal)
        verificationButton.layer.cornerRadius = 5
        verificationButton.addTarget(self, action: #selector(handleVerification), for: .touchUpInside)
        return verificationButton
    }()
    
    @objc private  func handleVerification() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        cancelButton()
        view.addSubview(titleView)
        view.addSubview(subTitleView)
        view.addSubview(verificationButton)
        
        _ = titleView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 120, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        _ = subTitleView.anchor(titleView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 11, leftConstant: 20, bottomConstant: 0, rightConstant: 20)
        _ = verificationButton.anchor(subTitleView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 16, bottomConstant: 0, rightConstant: 16, heightConstant: 55)
    }
}
