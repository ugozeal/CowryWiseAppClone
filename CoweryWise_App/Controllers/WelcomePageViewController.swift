//
//  WelcomePageViewController.swift
//  CoweryWise_App
//
//  Created by David U. Okonkwo on 9/30/20.
//

import UIKit

class WelcomePageViewController: UIViewController {
    
    let imageStackView: UIStackView = {
        let imageStackView = UIStackView()
        imageStackView.alignment = .leading
        imageStackView.axis = .vertical
        
        let imageView: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFit
            image.backgroundColor = .white
            image.image = UIImage(named: StringsConstants.pageThreeImage)
            image.clipsToBounds = true
            return image
        }()
        imageStackView.addArrangedSubview(imageView)
        _ = imageView.anchor(imageStackView.topAnchor, left: imageStackView.leftAnchor, bottom: nil, right: imageStackView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 310, widthConstant: 80, heightConstant: 80)
        return imageStackView
    }()
    let titleView: UILabel = {
        let titleViewText = UILabel()
        titleViewText.text = StringsConstants.welcomeTitleText
        titleViewText.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
        titleViewText.textColor = .black
        return titleViewText
    }()
    
    
    let subTitleView: UILabel = {
        let subTitleViewText = UILabel()
        subTitleViewText.text = StringsConstants.welcomeSubTitleText
        subTitleViewText.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        subTitleViewText.textColor = #colorLiteral(red: 0.315443933, green: 0.3746806979, blue: 0.4743874669, alpha: 1)
        subTitleViewText.lineBreakMode = .byWordWrapping
        subTitleViewText.numberOfLines = 0
        return subTitleViewText
    }()
    
    func cancelButton(){
        let closeIcon = UIBarButtonItem(title: StringsConstants.cancelButtonIcon, style: .plain, target: self, action: #selector(goToHome))
        navigationItem.rightBarButtonItem = closeIcon
        closeIcon.tintColor = .black
        closeIcon.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: StringsConstants.georgiaBoldFont, size: 50.0)!], for: UIControl.State.normal)
        closeIcon.setTitlePositionAdjustment(UIOffset(horizontal: 0.0, vertical: 5.0), for: UIBarMetrics.default)
    }
    
    @objc func goToHome(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        cancelButton()
        view.addSubview(titleView)
        view.addSubview(subTitleView)
        view.addSubview(imageStackView)
        
        _ = imageStackView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 140, leftConstant: 20, bottomConstant: 0, widthConstant: 70, heightConstant: 70)
        _ = titleView.anchor(imageStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 50, leftConstant: 20)
        _ = subTitleView.anchor(titleView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 20)
    }
}
