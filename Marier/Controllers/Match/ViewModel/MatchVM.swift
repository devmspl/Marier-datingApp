//
//  MatchVM.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import UIKit

class MatchVM: NSObject {

    func addSearchView(view: String)-> UIViewController{
        if view == "search"{
            let vc = storyBoards.Match.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
            return vc
        }else{
            let vc = storyBoards.Match.instantiateViewController(withIdentifier: "NearbyVC") as! NearbyVC
            return vc
        }
       
    }    
}
