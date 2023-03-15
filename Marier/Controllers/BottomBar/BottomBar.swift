//
//  BottomBar.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import UIKit
import SocketIO
class BottomBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        curvedView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        curvedView()
        socket.connect()

    }
   
    func curvedView(){
        self.tabBar.layer.shadowRadius = 5
        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.2, height: 0.5)
        self.tabBar.layer.shadowOpacity = 1
        self.selectedIndex = 0
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
