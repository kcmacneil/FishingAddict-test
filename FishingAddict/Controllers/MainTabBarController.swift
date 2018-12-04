//
//  MainTabBarController.swift
//  FishingAddict
//
//  Created by Kevin MacNeil on 12/3/18.
//  Copyright © 2018 wirehigh. All rights reserved.
//
	
import UIKit
class MainTabBarController: UITabBarController {
// MARK: - Properties
let photoHelper = FAPhotoHelper()
	
// MARK - Helper Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		
		photoHelper.completionHandler = { image in
			PostService.create(for: image)
		}

		delegate = self
		tabBar.unselectedItemTintColor = .black
	}
}

// MARK: - Extensions
extension MainTabBarController: UITabBarControllerDelegate {
	func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
		if viewController.tabBarItem.tag == 1 {
			// present photo taking action sheet
			photoHelper.presentActionSheet(from: self)
			return false
		} else {
			return true
		}
	}
}
