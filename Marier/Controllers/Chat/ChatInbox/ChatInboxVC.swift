//
//  ChatInboxVC.swift
//  Marier
//
//  Created by MacBook M1 on 11/01/23.
//

import UIKit
import SocketIO

class ChatInboxVC: UIViewController {

    @IBOutlet weak var messageHeight: NSLayoutConstraint!
    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var chatInboxTable: UITableView!
    @IBOutlet weak var typeMsgView: UIView!
    @IBOutlet weak var typeMessage: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var sendBtn: UIButton!
    ///
    var roomId = ""
    var otherUserId = ""
    var avatar = ""
    var name = ""
    ///
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
        chatInboxTable.keyboardDismissMode = .interactive
        messageText.delegate = self
    }
    //////////////////////
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.setRoom(receiver: otherUserId, reloadTable: chatInboxTable)
           
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sendBtn.backgroundColor = .gray
        viewModel.scrollToBottom(table: chatInboxTable)
    }
    ///
    func loadViews() {
        chatInboxTable.register(UINib(nibName: "ChatTableRightCell", bundle: nil), forCellReuseIdentifier: "ChatTableRightCell")
        chatInboxTable.register(UINib(nibName: "ChatTableLeftCell", bundle: nil), forCellReuseIdentifier: "ChatTableLeftCell")
        userImage.setImage(imageStr: avatar)
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.contentMode = .scaleAspectFill
        username.text = name
        
    }
    //MARK: - PRIVATE FUNCTION
    internal lazy var viewModel: ChatInboxVM = {
        return ChatInboxVM()
    }()
    
    ///
    @IBAction func videoTapped(_ sender: UIButton){
        
    }
    
    @IBAction func optionTapped(_ sender: UIButton){
        
    }
    
    @IBAction func backTapped(_ sender: UIButton){
        self.poptoViewController()
    }
    
    @IBAction func sendMessagge(_ sender: UIButton){
        
        if messageText.text != ""{
            viewModel.sendMessage(receiver: otherUserId, content: messageText.text!, table: chatInboxTable)
            messageHeight.constant = 40
            messageText.text = ""
        }
    }
}
