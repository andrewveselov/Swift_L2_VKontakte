//
//  User.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 23/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//

import UIKit

enum Gender {
    case male, female
}

struct UserModel {
    var name: String
    var gender: Gender
    var avatar: UIImage

    init(name: String, gender: Gender, avatar: UIImage) {
        self.name = name
        self.gender = gender
        self.avatar = avatar
    }
}
