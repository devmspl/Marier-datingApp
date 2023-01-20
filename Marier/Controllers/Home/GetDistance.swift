//
//  GetDistance.swift
//  Marier
//
//  Created by MacBook M1 on 20/01/23.
//

import Foundation
import DropDown

struct GetDistance{
    
    func getDist(drop: DropDown,view: UITextField,dropArray: [String])->Int{
        drop.show()
        var selectedText = "10"
        drop.anchorView = view
        drop.dataSource = dropArray
        drop.selectionAction = { (index: Int,Item: String) in
            drop.hide()
            selectedText = Item
        }
        return Int(selectedText)!
    }
}
