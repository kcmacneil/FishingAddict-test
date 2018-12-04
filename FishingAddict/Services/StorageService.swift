//
//  StorageService.swift
//  FishingAddict
//
//  Created by Kevin MacNeil on 12/3/18.
//  Copyright © 2018 wirehigh. All rights reserved.
//

import UIKit
import FirebaseStorage

struct StorageService {
	// provide method for uploading images
	
	// Mark: class methods
	static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
		// 1
		guard let imageData = image.jpegData(compressionQuality: 0.1) else {
			return completion(nil)
		}
		
		// 2
		reference.putData(imageData, metadata: nil, completion: { (metadata, error) in
			// 3
			if let error = error {
				assertionFailure(error.localizedDescription)
				return completion(nil)
			}
			
			// 4
			reference.downloadURL(completion: { (url, error) in
				if let error = error {
					assertionFailure(error.localizedDescription)
					return completion(nil)
				}
				completion(url)
			})
		})
	}
}
