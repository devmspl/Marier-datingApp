//
//  SocketConnect.swift
//  Marier
//
//  Created by MacBook M1 on 30/01/23.
//

import Foundation
import SocketIO


let socketManager = SocketManager(socketURL: URL(string: "http://18.189.74.89:9001/chat")!, config: [.log(true),.compress,.connectParams(["token":getUserToken()])])
var socket = socketManager.defaultSocket
