//
//  ChatInboxVM.swift
//  Marier
//
//  Created by MacBook M1 on 11/01/23.
//

import UIKit
import SocketIO

class ChatInboxVM: NSObject {
    
    var arrMessage = [getMessageModel]()
    
    
    func getChat(roomId: String,reloadTable: UITableView){
        socket.emit("get-chat",[
        "roomId":roomId,
        "userId":getUserId(),
        "pageSize":20,
        "pageNo":1
        ])
        socket.on("get-chat") { [self] data, ack in
            print(data)
            arrMessage = getUsers(data: data)
            reloadTable.reloadData()
        }
    }
      
    func setRoom(receiver: String){
       socket.emit("set-room",["sender":getUserId(),"reciever":receiver]);
    }
  
    func getUsers(data: [Any?])->[getMessageModel]{
        if !(data.isEmpty){
            let metaData = data[0]
            let convertedData = try! JSONSerialization.data(withJSONObject: metaData)
            let json = try! JSONSerialization.jsonObject(with: convertedData) as! [AnyObject]
            arrMessage.removeAll()
            if !(json.isEmpty){
                for i in 0...json.count-1{
                    let jsonData = json[i] as! [String: Any]
                    let finalResponse = try! loader.loadAPIResponse(response: jsonData,responseModel: getMessageModel.self)
                    arrMessage.append(finalResponse)
                }
            }
            return arrMessage
        }else{
            return arrMessage
        }
    }
    
//    func sendMessage(messageTextField: UITextField,tableToReload: UITableView){
//        arr.append(timeText(time: currentTime(), msg: messageTextField.text))
//        messageTextField.text = ""
//        tableToReload.reloadData()
//    }
}
