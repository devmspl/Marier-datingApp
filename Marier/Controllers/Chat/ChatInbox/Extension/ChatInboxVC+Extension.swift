//
//  ChatInboxVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 01/02/23.
//

import Foundation
import UIKit

extension ChatInboxVC: UITextViewDelegate{
   
    func textViewDidChange(_ textView: UITextView) {
       self.messageHeight.constant = textView.contentSize.height
       self.view.layoutIfNeeded()
        changeBtnColor()
    }
    
    func changeBtnColor() {
        if messageText.text == ""{
            sendBtn.backgroundColor = .gray
        }else{
            sendBtn.backgroundColor = UIColor(named: "upperGradientColor")
        }
    }
}
extension ChatInboxVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrMessage.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rightCell = tableView.dequeueReusableCell(withIdentifier: "ChatTableRightCell", for: indexPath) as! ChatTableRightCell
        let leftCell = tableView.dequeueReusableCell(withIdentifier: "ChatTableLeftCell", for: indexPath) as! ChatTableLeftCell
        if viewModel.arrMessage[indexPath.row].sender == getUserId(){
            rightCell.cellConfig(data: viewModel.arrMessage[indexPath.row])
            return rightCell
        }else{
            leftCell.cellConfig(config: viewModel.arrMessage[indexPath.row])
            leftCell.userImage.setImage(imageStr: avatar)
            return leftCell
        }
    }
}
