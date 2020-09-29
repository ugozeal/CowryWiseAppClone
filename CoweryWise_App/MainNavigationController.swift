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
            let homeController = HomeController()
            viewControllers = [homeController]
            // assume user is logged in
        }else{
            perform(#selector(showLogInController), with: nil, afterDelay: 0.01)
           
        }
    }
    fileprivate func isLoggedIn() -> Bool{
        //return UserDefaults.standard.isLoggedIn()
        return true
    }
    
    @objc func showLogInController(){
        let logInController = LoginViewController()
        logInController.modalPresentationStyle = .fullScreen
        present(logInController, animated: true, completion: {
            // Put something here
        })
    }
}


