//
//  ViewController.swift
//  CoweryWise_App
//
//  Created by David U. Okonkwo on 9/28/20.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var pageControlBottomAnchor: NSLayoutConstraint?
    
    lazy var collecttionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    let buttonView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var pageController: UIPageControl = {
       let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        pc.numberOfPages = pages.count
        return pc
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        button.setTitle("SIGN UP", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let loginbutton = UIButton(type: .system)
        loginbutton.backgroundColor = .white
        loginbutton.setTitle("LOG IN", for: .normal)
        loginbutton.setTitleColor(UIColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1), for: .normal)
        loginbutton.layer.cornerRadius = 5
        loginbutton.layer.borderColor = CGColor(red: 1/255, green: 101/255, blue: 245/255, alpha: 1)
        loginbutton.layer.borderWidth = 1
        loginbutton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return loginbutton
    }()
    
    @objc private  func handleLogin() {
        let seguePath = LoginController()
        let navController = UINavigationController(rootViewController: seguePath)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
    @objc private  func handleSignUp() {
        let seguePath = SignupViewController()
        let navController = UINavigationController(rootViewController: seguePath)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
    
    
    let pages : [Pages] = {
        let firstPage = Pages(title: StringsConstants.pageOneTitle, message: StringsConstants.pageOneMessage, imageName: StringsConstants.pageOneImage)
        let secondPage = Pages(title: StringsConstants.pageTwoTitle , message: StringsConstants.pageTwoMessage, imageName: StringsConstants.pageTwoImage)
        let thirdPage = Pages(title: StringsConstants.pageThreeTitle, message: StringsConstants.pageThreeMessage, imageName: StringsConstants.pageThreeImage)
        let fourthPage = Pages(title: StringsConstants.pageFourTitle, message: StringsConstants.pageFourMessage, imageName: StringsConstants.pageFourImage)

        
        return [firstPage, secondPage, thirdPage, fourthPage]
    }()
    
    fileprivate func registerCell(){
        collecttionView.register(PageCell.self, forCellWithReuseIdentifier: StringsConstants.cellId)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collecttionView)
        view.addSubview(buttonView)
        view.addSubview(pageController)
        buttonView.addSubview(loginButton)
        buttonView.addSubview(signUpButton)
        view.backgroundColor = .white
        _ = collecttionView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 40, leftConstant: 0, bottomConstant: 500, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        collecttionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75).isActive = true
        buttonView.anchorToTop(collecttionView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        pageControlBottomAnchor = pageController.anchor(nil, left: view.leftAnchor, bottom: buttonView.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 15, rightConstant: 0, widthConstant: 0, heightConstant: 40)[1]
        
        _ = signUpButton.anchor(nil, left: buttonView.leftAnchor, bottom: nil, right: buttonView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        
        _ = loginButton.anchor(signUpButton.bottomAnchor, left: buttonView.leftAnchor, bottom: nil, right: buttonView.rightAnchor, topConstant: 12, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 50)
        registerCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringsConstants.cellId, for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageController.currentPage = pageNumber
        
    }
        

}

