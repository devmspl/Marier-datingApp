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
    
    //getchart
    func getChat(roomId: String,reloadTable: UITableView){
        socket.emit("get-chat",[
        "roomId":roomId,
        "userId":getUserId(),
        "pageSize":1000,
        "pageNo":1
        ])
        currentMessage(table: reloadTable)
        chat(table: reloadTable)
    }
    //append chat
    func chat(table:UITableView){
        socket.on("get-chat") { [self] data, ack in
            print(data)
            arrMessage = getUsers(data: data)
            table.reloadData()
            scrollToBottom(table: table)
        }
    }
    //currentMessage
    func currentMessage(table: UITableView){
        socket.on("chat-msg"){data,ack in
            let dat = data[0] as! [String:Any]
            let converted = try! loader.loadAPIResponse(response: dat, responseModel: getMessageModel.self)
            self.arrMessage.append(converted)
            table.reloadData()
            self.scrollToBottom(table: table)
        }
    }
    //setRoom
    func setRoom(receiver: String){
       socket.emit("set-room",["sender":getUserId(),"receiver":receiver]);
    }
  //getusers
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
    
    func scrollToBottom(table:UITableView){
        
        var section = max(table.numberOfSections - 1, 0)
         var row = max(table.numberOfRows(inSection: section) - 1, 0)
         var indexPath = IndexPath(row: row, section: section)

           DispatchQueue.main.async {

               if indexPath.row > 0{
                   table.scrollToRow(at: indexPath, at: .bottom, animated: false)

               }
  }
    }
}
