//
//  TableViewCell.swift
//  TweeterTags
//
//  Created by 罗俊豪 on 08/03/2022.
//

import UIKit

class TableViewCell: UITableViewCell {



    @IBOutlet weak var tweetTitle: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var tweetDate: UILabel!
    @IBOutlet weak var tweetImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
