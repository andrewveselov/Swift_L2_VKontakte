//
//  FriendsCell.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 23/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {

    static let reuseIdentifier = "FriendsCell"
    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
/*
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
*/
}
