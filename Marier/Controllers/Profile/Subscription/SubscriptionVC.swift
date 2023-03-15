//
//  SubscriptionVC.swift
//  Marier
//
//  Created by MacBook M1 on 21/02/23.
//

import UIKit

class SubscriptionVC: UIViewController {

    @IBOutlet weak var subscriptionTable: UITableView!
    @IBOutlet weak var subtableHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        subscriptionTable.register(UINib(nibName: "PremiumTableCell", bundle: nil), forCellReuseIdentifier: "PremiumTableCell")
    }
    
    override func viewWillLayoutSubviews() {
//        super.updateViewConstraints()
        super.viewWillLayoutSubviews()
        subtableHeight.constant = subscriptionTable.contentSize.height
    }
    
    @IBAction func backTapped(_ sender: UIButton){
        self.poptoViewController()
    }
    
    @IBAction func subscriptionTapped(_ sender: UIButton){
        
    }
}
