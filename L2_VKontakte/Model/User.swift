//
//  User.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 23/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//

import Foundation

enum Gender {
    case male, female
}

struct UserModel {
    var name: String
    var gender: Gender
    var avatarURL: String

    init(name:String, gender:Gender, avatarURL:String) {
        self.name = name
        self.gender = gender
        self.avatarURL = avatarURL
    }
}
