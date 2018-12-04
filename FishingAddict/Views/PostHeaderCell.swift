//
//  PostHeaderCell.swift
//  FishingAddict
//
//  Created by Kevin MacNeil on 12/3/18.
//  Copyright © 2018 wirehigh. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
static let height: CGFloat = 54

	@IBOutlet weak var usernameLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	@IBAction func optionsButtonTapped(_ sender: Any) {
	print("options button tapped")
	}
}
