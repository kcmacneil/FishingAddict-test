//
//  StorageReference+Post.swift
//  FishingAddict
//
//  Created by Kevin MacNeil on 12/3/18.
//  Copyright © 2018 wirehigh. All rights reserved.
//

import Foundation
import FirebaseStorage

extension StorageReference {
	static let dateFormatter = ISO8601DateFormatter()
	
	static func newPostImageReference() -> StorageReference {
		let uid = User.current.uid
		let timestamp = dateFormatter.string(from: Date())
		return Storage.storage().reference().child("images/posts/\(uid)/\(timestamp).jpg")
	}
}
