//
//  NavigationControl.swift
//  Marier
//
//  Created by MacBook M1 on 21/01/23.
//

import Foundation
import UIKit
import Toast

struct Navigation{
    
    var windows = UIWindow(frame: UIScreen.main.bounds)
   
    func getUserDataAndNavigate(completion:@escaping(Bool,UINavigationController,String)->()){
        ApiManager.shared.getDataApi(requestUrl: ApiUrls.getCurrentUser+getUserId(), httpMethod: .get, resultType: BaseResponse<UserData>.self) { result, statusCode, isSuccess, error in
            if isSuccess{
                let navigate = navigateTo(loginData: (result?.data)!)
               completion(isSuccess,navigate,"")
            }else{
                completion(isSuccess,navigateToLanding(),error)
            }
        }
    }
    
    func navigateTo(loginData:UserData)->UINavigationController{
            ///Navigate to sexual orientationscreen
            if loginData.sexualOrientations.isEmpty{
                let vc = storyBoards.Main.instantiateViewController(withIdentifier: "SexualOrientationVC") as! SexualOrientationVC
                let nav = UINavigationController(rootViewController: vc)
                nav.isNavigationBarHidden = true
              return nav
            }
            ///Navigate to interests screen
            else if loginData.interests.isEmpty{
                let vc = storyBoards.Main.instantiateViewController(withIdentifier: "AddInterestVC") as! AddInterestVC
                let nav = UINavigationController(rootViewController: vc)
                nav.isNavigationBarHidden = true
                return nav
            }
            ///Navigate to add images  screen
            else if loginData.gallery.isEmpty{
                let vc = storyBoards.Main.instantiateViewController(withIdentifier: "AddImagesVC") as! AddImagesVC
                let nav = UINavigationController(rootViewController: vc)
                nav.isNavigationBarHidden = true
                return nav
            }
            ///Navigate to bottomBar
            else{
                let vc = storyBoards.TabBar.instantiateViewController(withIdentifier: "BottomBar") as! BottomBar
                let nav = UINavigationController(rootViewController: vc)
                nav.isNavigationBarHidden = true
                return nav
            }
        }
                          
                          
        func navigateToLanding()->UINavigationController{
                let vc = storyBoards.Main.instantiateViewController(withIdentifier: "LandingVC") as! LandingVC
                let nav = UINavigationController(rootViewController: vc)
                nav.isNavigationBarHidden = true
                return nav
               }
                          

}
