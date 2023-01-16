//
//  ChatInboxVC.swift
//  Marier
//
//  Created by MacBook M1 on 11/01/23.
//

import UIKit

class ChatInboxVC: UIViewController {

    @IBOutlet weak var chatInboxTable: UITableView!
    @IBOutlet weak var typeMsgView: UIView!
    @IBOutlet weak var typeMessage: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var sendBtn: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
        typeMessage.delegate = self
    }
    //////////////////////
    func loadViews() {
        chatInboxTable.register(UINib(nibName: "ChatTableRightCell", bundle: nil), forCellReuseIdentifier: "ChatTableRightCell")
    }
    //MARK: - PRIVATE FUNCTION
    private lazy var viewModel: ChatInboxVM = {
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
        if typeMessage.text == ""{
            print("hello")
        }else{
            viewModel.sendMessage(messageTextField: typeMessage, tableToReload: chatInboxTable)

        }
    }

   
}
extension ChatInboxVC: UITextFieldDelegate{
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        changeBtnColor()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        changeBtnColor()
    }
    func changeBtnColor() {
        if typeMessage.text == ""{
            sendBtn.backgroundColor = .gray
        }else{
            sendBtn.backgroundColor = UIColor(named: "upperGradientColor")
        }
        
    }
}
extension ChatInboxVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableRightCell", for: indexPath) as! ChatTableRightCell
        cell.msgLabel.text = viewModel.arr[indexPath.row]?.msg
        cell.timeLabel.text = viewModel.arr[indexPath.row]?.time
        return cell
    }
    
}


struct timeText{
    let time: String?
    let msg: String?
}
