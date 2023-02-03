//
//  AllChatVM.swift
//  Marier
//
//  Created by MacBook M1 on 30/01/23.
//

import Foundation
import SocketIO
import Alamofire
import SwiftyJSON

class AllChatVM: NSObject{
    
    var chatData = [GetChatUserModel]()
    
    func connectSocket(table: UITableView){
            socket.emit("join-user", getUserId())
            socket.on("get-room-stack") { [self] data, ack in
                    print("sdfghj",data,"sdfghj")
               chatData = getUsers(data: data)
                table.reloadData()
                }
    }
//MARK: - get userChatData
    func getUsers(data: [Any?])->[GetChatUserModel]{
        if !(data.isEmpty){
            let metaData = data[0]
            let convertedData = try! JSONSerialization.data(withJSONObject: metaData)
            let json = try! JSONSerialization.jsonObject(with: convertedData) as! [AnyObject]
            chatData.removeAll()
            if !(json.isEmpty){
                for i in 0...json.count-1{
                    let jsonData = json[i] as! [String: Any]
                    let finalResponse = try! loader.loadAPIResponse(response: jsonData,responseModel: GetChatUserModel.self)
                    chatData.append(finalResponse)
                }
            }
            return chatData
        }else{
            return chatData
        }
       
    }
}

