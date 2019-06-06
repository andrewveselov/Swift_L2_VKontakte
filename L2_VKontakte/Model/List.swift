//
//  List.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 30/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//

import UIKit

struct ListModel {
    var message: String
    var likes: Int
    var name: String
    var avatar: UIImage

    
    init(name: String, avatar: UIImage, message: String) {
        self.name = name
        self.avatar = avatar
        self.message = message
        self.likes = 0
    }
}
