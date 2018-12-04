//
//  UIImage+Size.swift
//  FishingAddict
//
//  Created by Kevin MacNeil on 12/3/18.
//  Copyright © 2018 wirehigh. All rights reserved.
//

import UIKit

extension UIImage {
	var aspectHeight: CGFloat {
		let heightRatio = size.height / 736
		let widthRatio = size.width / 414
		let aspectRatio = fmax(heightRatio, widthRatio)
		
		return size.height / aspectRatio
	}
}
