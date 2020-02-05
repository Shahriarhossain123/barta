//
//  SearchCell.swift
//  Barta
//
//  Created by Apple MacBook Pro  on 2/5/20.
//  Copyright © 2020 Apple MacBook Pro . All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var newsimage: UIImageView!
    @IBOutlet weak var textlable: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 10
        newsimage.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
