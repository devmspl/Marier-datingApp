//
//  AllChatVC.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import UIKit

class AllChatVC: UIViewController {

    @IBOutlet weak var emptyInbox: UIImageView!
    @IBOutlet weak var chatTable: UITableView!
    
    private var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    // Do any additional setup after loading the view.
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.connectSocket(table: chatTable)
    }
    
    //MARK: - privateFunctions
    private lazy var viewModel: AllChatVM = {
        return AllChatVM()
    }()
    
    func loadData(){
      
        chatTable.register(UINib(nibName: "chatTableCell", bundle: nil), forCellReuseIdentifier: "ChatTableCell")
    }

}

extension AllChatVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.chatData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTable.dequeueReusableCell(withIdentifier: "ChatTableCell") as! ChatTableCell
        cell.cellConfig(data: viewModel.chatData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyBoards.Chat.instantiateViewController(withIdentifier: "ChatInboxVC") as! ChatInboxVC
        vc.roomId = viewModel.chatData[indexPath.row].roomId ?? ""
        vc.otherUserId = viewModel.chatData[indexPath.row].user?.id ?? ""
        vc.avatar = viewModel.chatData[indexPath.row].user?.avatar ?? ""
        vc.name = (viewModel.chatData[indexPath.row].user?.name) ?? ""
        self.pushVC(controller: vc)
    }
}

