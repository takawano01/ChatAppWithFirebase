//
//  User.swift
//  ChatAppWithFirebase
//
//  Created by 河野隆 on 2020/09/21.
//  Copyright © 2020 河野隆. All rights reserved.
//

import Foundation
import Firebase

class User {
    
    let email: String
    let username: String
    let createdAt: Timestamp
    let profileImageUrl: String
    
    init(dic: [String: Any]) {
        self.email = dic["email"] as? String ?? ""
        self.username = dic["username"] as? String ?? ""
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
        self.profileImageUrl = dic["profileImageUrl"] as? String ?? ""
    }
}
