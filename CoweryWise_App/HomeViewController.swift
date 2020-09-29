//
//  HomeViewController.swift
//  CoweryWise_App
//
//  Created by David U. Okonkwo on 9/28/20.
//

import UIKit

class HomeController: UIViewController {
    

    
    let titleView: UITextView = {
        let tv = UITextView()
        tv.text = "Log In.\n"
        tv.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.semibold)
        
        tv.isEditable = false
        tv.textColor = .white
        tv.backgroundColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        tv.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    let subTitleView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.text = "It's a good day to save"
        tv.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        tv.textColor = .white
        tv.backgroundColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        tv.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleView)
        view.addSubview(subTitleView)
//        view.backgroundColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        
        titleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        titleView.anchorWithConstantsToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 600, rightConstant: 30)
        //subTitleView.anchorWithConstantsToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 30)
        subTitleView.anchor(titleView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 0)
    }
}
