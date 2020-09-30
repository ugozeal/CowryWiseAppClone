//
//  LoginCell.swift
//  CoweryWise_App
//
//  Created by David U. Okonkwo on 9/28/20.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isLoggedIn(){
            let homeController = LoginController()
            viewControllers = [homeController]
            // assume user is logged in
        }else{
            perform(#selector(showLogInController), with: nil, afterDelay: 0.01)
           
        }
    }
    fileprivate func isLoggedIn() -> Bool{
        //return UserDefaults.standard.isLoggedIn()
        return false
    }
    
    @objc func showLogInController(){
        let logInController = HomeViewController()
        logInController.modalPresentationStyle = .fullScreen
        present(logInController, animated: true, completion: {
            // Put something here
        })
    }
}


