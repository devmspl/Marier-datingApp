//
//  ChatInboxVM.swift
//  Marier
//
//  Created by MacBook M1 on 11/01/23.
//

import UIKit

class ChatInboxVM: NSObject {
    
    var arr = [timeText?]()
    
    func sendMessage(messageTextField: UITextField,tableToReload: UITableView){
        arr.append(timeText(time: currentTime(), msg: messageTextField.text))
        messageTextField.text = ""
        tableToReload.reloadData()
    }
}
