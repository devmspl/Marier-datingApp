//
//  ChatInboxVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 01/02/23.
//

import Foundation
import UIKit
///
///
extension ChatInboxVC: UITextViewDelegate{
   ///
    func textViewDidChange(_ textView: UITextView) {
       self.messageHeight.constant = textView.contentSize.height
       self.view.layoutIfNeeded()
        changeBtnColor()
    }
    
    func changeBtnColor() {
        if messageText.text == ""{
            sendBtn.backgroundColor = .gray
            sendBtn.setImage(UIImage(named: "mike"), for: .normal)
        }else{
            sendBtn.setImage(UIImage(named: "sendBtn"), for: .normal)
            sendBtn.backgroundColor = UIColor(named: "upperGradientColor")
        }
    }
}
///
///
///
extension ChatInboxVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == optionstable{
            return viewModel.optionsArray.count
        }else{
            return viewModel.arrMessage.count
        }
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == optionstable{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatOptionCell", for: indexPath) as! ChatOptionCell
            cell.optionText.text = self.viewModel.optionsArray[indexPath.row]
            cell.cellImage.isHidden = true
            if cell.optionText.text == "More"{
                cell.cellImage.isHidden = false
            }
            return cell
        }else{
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
    ///
    ///
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == optionstable{
            switch viewModel.optionsArray[indexPath.row] {
            case "View Contact":
                let vc = storyBoards.Chat.instantiateViewController(withIdentifier: "ViewContactVC") as! ViewContactVC
                self.optionView.removeFromSuperview()
                self.pushVC(controller: vc)
            default:
                print("sdvgadg")
            }
        }else{
            //
        }
    }
}
