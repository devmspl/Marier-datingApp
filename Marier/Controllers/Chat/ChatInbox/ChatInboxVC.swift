//
//  ChatInboxVC.swift
//  Marier
//
//  Created by MacBook M1 on 11/01/23.
//

import UIKit
import SocketIO

class ChatInboxVC: UIViewController {

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
        typeMessage.delegate = self
    }
    //////////////////////
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.setRoom(receiver: otherUserId)
        viewModel.getChat(roomId: roomId,reloadTable: chatInboxTable)
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
        
        let messagePayload: [String:Any] = ["senderId":getUserId(),
                              "receiverId":otherUserId,
                              "roomId":roomId,
                              "content": typeMessage.text,
                              "date":"\(Date())",
                             ]
        viewModel.getChat(roomId: roomId,reloadTable: chatInboxTable)
        if typeMessage.text == ""{
            print("hello")
        }else{
//            viewModel.arrMessage.append(messagePayload)
            
            socket.emit("chat-msg", messagePayload)
         
            socket.on("chat-msg"){da,md in
                print(da,md,"s")
            }
        }
    }
}
