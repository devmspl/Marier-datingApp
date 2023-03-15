//
//  RequestVC.swift
//  Marier
//
//  Created by MacBook M1 on 24/02/23.
//

import UIKit

class RequestVC: UIViewController {

    
    @IBOutlet weak var requestTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        requestTable.register(UINib(nibName: "RequestTableCell", bundle: nil), forCellReuseIdentifier: "RequestTableCell")
    }


}


