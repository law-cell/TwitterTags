//
//  imageCell.swift
//  TweeterTags
//
//  Created by 罗俊豪 on 13/03/2022.
//

import UIKit

class imageCell: UITableViewCell {

    @IBOutlet weak var mentionImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
