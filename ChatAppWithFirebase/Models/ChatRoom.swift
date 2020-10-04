//
//  ChatRoom.swift
//  ChatAppWithFirebase
//
//  Created by 河野隆 on 2020/09/25.
//  Copyright © 2020 河野隆. All rights reserved.
//

import Foundation
import Firebase

class ChatRoom {
    
    let latestMessageId: String
    let members: [String]
    let createdAt: Timestamp
    
    var documentId: String?
    var partnerUser: User?
    
    init(dic: [String: Any]) {
        self.latestMessageId = dic["latestMessageId"] as? String ?? ""
        self.members = dic["members"] as? [String] ?? [String]()
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
    }
    
}
