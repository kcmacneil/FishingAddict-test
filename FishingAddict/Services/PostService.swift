//
//  PostService.swift
//  FishingAddict
//
//  Created by Kevin MacNeil on 12/3/18.
//  Copyright © 2018 wirehigh. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

struct PostService {
	//Mark: PostService Methods
	
	static func create(for image: UIImage) {
		let imageRef = StorageReference.newPostImageReference()
		StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
			guard let downloadURL = downloadURL else {
				return
			}
			
			let urlString = downloadURL.absoluteString
			let aspectHeight = image.aspectHeight
        	create(forURLString: urlString, aspectHeight: aspectHeight)
		}
	}
	
	private static func create(forURLString urlString: String, aspectHeight: CGFloat) {
		// create new post in database
		// 1
		let currentUser = User.current
		// 2
		let post = Post(imageURL: urlString, imageHeight: aspectHeight)
		// 3
		let dict = post.dictValue
		// 4
		let postRef = Database.database().reference().child("posts").child(currentUser.uid).childByAutoId()
		//5
		postRef.updateChildValues(dict)
	}
	
}
