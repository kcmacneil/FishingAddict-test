//
//  LoginViewController.swift
//  FishingAddict
//
//  Created by Kevin MacNeil on 12/2/18.
//  Copyright © 2018 wirehigh. All rights reserved.
//
typealias FIRUser = FirebaseAuth.User

import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase


class LoginViewController: UIViewController {
	
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		//Dispose of resources that can be recreated
		
	}
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        print("login Button Tapped")
        guard let authUI = FUIAuth.defaultAuthUI()
            else {return}
        authUI.delegate = self
        let providers: [FUIAuthProvider] = [FUIGoogleAuth()]
        authUI.providers = providers
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}
//MARK: -Extensions
extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error{
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
		guard let user = authDataResult?.user
		else { return }
		
		
		UserService.show(forUID: user.uid) { (user) in
			if let user = user {
				// handle existing user
				User.setCurrent(user, writeToUserDefaults: true)
				let initialViewController = UIStoryboard.initialViewController(for: .main)
				self.view.window?.rootViewController = initialViewController
				self.view.window?.makeKeyAndVisible()
			} else {
				// handle new user
				self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
			}
		}
		
		print("handle user signup / login)")
    }
}
