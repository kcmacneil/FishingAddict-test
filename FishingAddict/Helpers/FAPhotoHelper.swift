//
//  FAPhotoHelper.swift
//  FishingAddict
//
//  Created by Kevin MacNeil on 12/3/18.
//  Copyright © 2018 wirehigh. All rights reserved.
//

import UIKit



class FAPhotoHelper: NSObject {
	
	// MARK: - Properties
	var completionHandler: ((UIImage) -> Void)?
	
	// MARK: - Helper Methods
	
	func presentImagePickerController(with sourceType: UIImagePickerController.SourceType, from viewController: UIViewController) {
		let imagePickerController = UIImagePickerController()
		imagePickerController.sourceType = sourceType
		imagePickerController.delegate = self
		viewController.present(imagePickerController, animated: true)
	}
	
	func presentActionSheet(from viewController: UIViewController) {
		let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
		if UIImagePickerController.isSourceTypeAvailable(.camera) {
			let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { action in
				self.presentImagePickerController(with: .camera, from: viewController)
			})
			alertController.addAction(capturePhotoAction)
		}

		if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
			let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { action in
				self.presentImagePickerController(with: .photoLibrary, from: viewController)
			})
			
			alertController.addAction(uploadAction)
		}
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		alertController.addAction(cancelAction)
		viewController.present(alertController, animated: true)
	}
}

extension FAPhotoHelper: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
			completionHandler?(selectedImage)
		}
		
		picker.dismiss(animated: true)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		picker.dismiss(animated: true)
	}
}
