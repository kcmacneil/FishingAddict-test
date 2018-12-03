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

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error{
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
		let user: FIRUser? = Auth.auth().currentUser
		print("handle user signup / login \(String(describing: user?.displayName))")
    }
}
