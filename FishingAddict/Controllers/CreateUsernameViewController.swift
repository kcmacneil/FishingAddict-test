//
//  CreateUsernameViewController.swift
//  FishingAddict
//
//  Created by Kevin MacNeil on 12/2/18.
//  Copyright © 2018 wirehigh. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad(){
		super.viewDidLoad()
	}
    
	@IBAction func nextButtonTapped(_ sender: UIButton) {
		guard let firUser = Auth.auth().currentUser,
			let username = usernameTextField.text,
			!username.isEmpty else { return }
		
		UserService.create(firUser, username: username) { (user) in
			guard let user = user else {
				// handle error
				return
			}
			//set userdefaults for persistance
			User.setCurrent(user, writeToUserDefaults: true)
			//redirect to main.storyboard
			let initialViewController = UIStoryboard.initialViewController(for: .main)
			self.view.window?.rootViewController = initialViewController
			self.view.window?.makeKeyAndVisible()
		}
	}
}
