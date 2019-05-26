//
//  GroupListCell.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 23/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//

import UIKit

class GroupListCell: UITableViewCell {

    static let reuseIdentifier = "GroupListCell"
    
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImageView: UIImageView!
    
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
