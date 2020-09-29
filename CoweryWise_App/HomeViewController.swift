//
//  HomeViewController.swift
//  CoweryWise_App
//
//  Created by David U. Okonkwo on 9/28/20.
//

import UIKit

class HomeController: UIViewController {
    
    let spaceView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()
    
    let titleView: UITextView = {
        let tv = UITextView()
        tv.text = "Log In.\n"
        tv.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.semibold)
        tv.backgroundColor = .purple
        tv.isEditable = false
        tv.textColor = .white
        //tv.backgroundColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
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
        view.addSubview(spaceView)
        spaceView.addSubview(titleView)
        spaceView.addSubview(subTitleView)
       view.backgroundColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        

        _ = spaceView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 500, rightConstant: 30, widthConstant: 0, heightConstant: 0)
        _ = titleView.anchor(spaceView.topAnchor, left: spaceView.leftAnchor, bottom: nil, right: spaceView.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        _ = subTitleView.anchor(titleView.bottomAnchor, left: spaceView.leftAnchor, bottom: nil, right: spaceView.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 0)

    }
}
