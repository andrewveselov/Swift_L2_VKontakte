//
//  Group.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 23/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//

import UIKit

struct GroupModel {
    var name: String
    var icon: UIImage
    
    init(name: String, icon: UIImage) {
        self.name = name
        self.icon = icon
    }
}
