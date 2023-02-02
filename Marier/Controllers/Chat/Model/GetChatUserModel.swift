//
//  GetChatUserModel.swift
//  Marier
//
//  Created by MacBook M1 on 30/01/23.
//

import Foundation
import SwiftyJSON

struct GetChatUserModel: Codable{
    let roomId: String?
    let messages: messages?
    let status: String?
    let user: chatUser?
    
    enum CodingKeys: String,CodingKey {
        case roomId = "_id"
        case messages
        case status
        case user
    }
}

struct messages: Codable{
    let lastMessage: message?
    let newMessage: [message]?
    
    enum CodingKeys: String,CodingKey {
        case lastMessage
        case newMessage = "newMessages"
    }
}

struct message: Codable{
    let content: String?
    let date: String?
    let status: String?
    let sender: String?
    let receiver: String?
    
    enum CodingKeys: String,CodingKey {
        case content,date,sender,receiver
       case status = "message_status"
    }
}

struct chatUser: Codable{
    let id :String?
    let avatar :String?
    let name: String?
    
    enum CodingKeys: String,CodingKey {
        case id = "_id"
        case avatar
        case name
    }
}


struct getMessageModel: Codable{
    let content: String?
    let date: String?
    let roomId: String?
    let sender: String?
    let receiver: String?
    
    enum CodingKeys: String,CodingKey {
        case content,date,sender,receiver
        case roomId = "room"
    }
}
