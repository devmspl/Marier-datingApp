//
//  HomeVC.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit
import Koloda

class HomeVC: UIViewController {

    @IBOutlet weak var swipeView: KolodaView!
    override func viewDidLoad() {
        super.viewDidLoad()

        swipeView.delegate = self
        swipeView.dataSource = self
    }

}
