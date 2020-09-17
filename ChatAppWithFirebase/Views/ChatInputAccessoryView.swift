//
//  ChatInputAccesoryView.swift
//  ChatAppWithFirebase
//
//  Created by 河野隆 on 2020/09/15.
//  Copyright © 2020 河野隆. All rights reserved.
//

import UIKit

class ChatInputAccessoryView: UIView {
    
    @IBOutlet weak var chatTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func tappedSendButton(_ sender: Any) {
        print("tapped SendButton")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    private func setupViews() {
        chatTextView.layer.cornerRadius = 15
        chatTextView.layer.borderColor = UIColor.rgb(red: 230, green: 230, blue: 230).cgColor
        chatTextView.layer.borderWidth = 1
        
        sendButton.layer.cornerRadius = 15
        sendButton.imageView?.contentMode = .scaleAspectFill
        sendButton.contentHorizontalAlignment = .fill
        sendButton.contentVerticalAlignment = .fill
        sendButton.isEnabled = false
        
        chatTextView.text = ""
        chatTextView.delegate = self
        
    }
    
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    
    static func nibInit() -> ChatInputAccessoryView {
        let nib = UINib(nibName: "ChatInputAccessoryView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! ChatInputAccessoryView
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        return view
    }
    

    
}

extension ChatInputAccessoryView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
//        print("textView.text: ", textView.text)
        if textView.text.isEmpty {
            sendButton.isEnabled = false
        } else {
            sendButton.isEnabled = true
        }
    }
}
