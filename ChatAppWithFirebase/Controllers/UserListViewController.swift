//
//  UserListViewController.swift
//  ChatAppWithFirebase
//
//  Created by 河野隆 on 2020/09/22.
//  Copyright © 2020 河野隆. All rights reserved.
//

import UIKit
import Firebase
import Nuke

class UserListViewController: UIViewController {
    
    private let cellId = "cellId"
    private var users = [User]()
    
    @IBOutlet weak var userListTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userListTableView.delegate = self
        userListTableView.dataSource = self
        fetchUserInfoFromFirestore()
        
    }
    
    private func fetchUserInfoFromFirestore() {
        
        Firestore.firestore().collection("users").getDocuments { (snapshots, err) in
            if let err = err {
                print("user情報の取得に失敗しました。\(err)")
                return
            }
            
            snapshots?.documents.forEach({ (snapshot) in
                let dic = snapshot.data()
                let user = User.init(dic: dic)
                
                self.users.append(user)
                self.userListTableView.reloadData()
                
//                self.users.forEach { (user) in
//                    print("user.username: ", user.username)
//                }
            })
            
        }
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userListTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserListTableViewCell
        cell.user = users[indexPath.row]
        
        print(cell)
        
        return cell
    }

}

class UserListTableViewCell: UITableViewCell {
    
    var user: User? {
        didSet {
            usernameLabel.text = user?.username
            
            if let url = URL(string: user?.profileImageUrl ?? "") {
                print("url: ", url)
                Nuke.loadImage(with: url, into: userImageView)
            }
        }
    }
    

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
