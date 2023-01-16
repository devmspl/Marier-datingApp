//
//  AllChatVC.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import UIKit

class AllChatVC: UIViewController {

    @IBOutlet weak var chatTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
      
        chatTable.register(UINib(nibName: "chatTableCell", bundle: nil), forCellReuseIdentifier: "ChatTableCell")
        chatTable.reloadData()
    }

}

extension AllChatVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTable.dequeueReusableCell(withIdentifier: "ChatTableCell") as! ChatTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyBoards.Chat.instantiateViewController(withIdentifier: "ChatInboxVC") as! ChatInboxVC
        self.pushVC(controller: vc)
    }
}
