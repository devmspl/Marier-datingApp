//
//  SocketConnect.swift
//  Marier
//
//  Created by MacBook M1 on 30/01/23.
//

import Foundation
import SocketIO


let socketManager = SocketManager(socketURL: URL(string: "https://marier.one:9001/chat")!, config: [.log(true),.compress,.connectParams(["token":getUserToken()])])
var socket = socketManager.defaultSocket
