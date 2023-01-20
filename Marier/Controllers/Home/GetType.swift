//
//  SetSexType.swift
//  Marier
//
//  Created by MacBook M1 on 20/01/23.
//

import Foundation

struct GetType{
    func sexType(index: Int)->String{
        if index == 0{
            return "male"
        }else if index == 1{
            return "female"
        }else{
            return "other"
        }
    }
}
