//
//  ChatRoomViewController.swift
//  ChatAppWithFirebase
//
//  Created by 河野隆 on 2020/09/15.
//  Copyright © 2020 河野隆. All rights reserved.
//

import UIKit

class ChatRoomViewController: UIViewController {
    
    private let cellID = "cellId"
    private var messages = [String]()
    
    private lazy var chatInputAccesoryView: ChatInputAccessoryView = {
        let view = ChatInputAccessoryView.nibInit()
        view.frame = .init(x: 0, y: 0, width: view.frame.width, height: 100)
        view.delegate = self
        return view
    }()
    
    @IBOutlet weak var chatRoomTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatRoomTableView.delegate = self
        chatRoomTableView.dataSource = self
        chatRoomTableView.register(UINib(nibName: "ChatRoomTableViewCell", bundle: nil),
                                   forCellReuseIdentifier: cellID)
        chatRoomTableView.backgroundColor = .rgb(red: 118, green: 140, blue: 180)
    }
    
    override var inputAccessoryView: UIView? {
        get {
            return chatInputAccesoryView
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
}

extension ChatRoomViewController: ChatInputAccessoryViewDelegate {
    
    func tappedSendButton(text: String) {
        messages.append(text)
        chatInputAccesoryView.removeText()
        chatRoomTableView.reloadData()
    }
    
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        chatRoomTableView.estimatedRowHeight = 20
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatRoomTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)  as! ChatRoomTableViewCell
//        cell.messageTextView.text = messages[indexPath.row]
        cell.messageText = messages[indexPath.row]
        return cell
        
    }
    
}
