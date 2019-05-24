//
//  Group.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 23/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//

import Foundation

struct GroupModel {
    var name: String
    var id: Int
    var iconURL: String
    
    init(name:String, iconURL:String) {
        self.name = name
        self.iconURL = iconURL
        self.id = 1
    }
}
