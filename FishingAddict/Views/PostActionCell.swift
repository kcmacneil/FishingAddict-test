//
//  PostActionCell.swift
//  FishingAddict
//
//  Created by Kevin MacNeil on 12/4/18.
//  Copyright © 2018 wirehigh. All rights reserved.
//

import UIKit

class PostActionCell: UITableViewCell {
	static let height: CGFloat = 46
	//MARK: - Subviews
	@IBOutlet weak var likeButton: UIButton!
	@IBOutlet weak var likeCountLabel: UILabel!
	@IBOutlet weak var timeAgoLabel: UILabel!
	
	// MARK: - Cell Lifecycle
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	// MARK: - IBActions
	
	@IBAction func likeButtonTapped(_ sender: Any) {
	print("like button tapped")
	}
	
}
