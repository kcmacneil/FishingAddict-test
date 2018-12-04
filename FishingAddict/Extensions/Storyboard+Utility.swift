//
//  Storyboard+Utility.swift
//  FishingAddict
//
//  Created by Kevin MacNeil on 12/2/18.
//  Copyright © 2018 wirehigh. All rights reserved.
//

import UIKit

extension UIStoryboard {
	//MARK: - Properties
	
	enum FAType: String {
		case main
		case login
		var filename: String {
			return rawValue.capitalized
		}
	}
	
	convenience init(type: FAType, bundle: Bundle? = nil) {
		self.init(name: type.filename, bundle: bundle)
	}
	//MARK: - Methods
	static func initialViewController(for type: FAType) -> UIViewController {
		let storyboard = UIStoryboard(type: type)
		guard let initialViewController = storyboard.instantiateInitialViewController() else {
			fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
		}
		return initialViewController
	}
}
