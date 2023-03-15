//
//  PrivacyVC.swift
//  Marier
//
//  Created by MacBook M1 on 27/02/23.
//

import UIKit

class PrivacyVC: UIViewController {

    @IBOutlet weak var privacyTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }//
    //MARK: - Private functions
    
    internal var viewModel: PrivacyVM = {
        return PrivacyVM()
    }()
    //
    override func loadView() {
        super.loadView()
        privacyTable.register(UINib(nibName: "PrivacyCell", bundle: nil), forCellReuseIdentifier: "PrivacyCell")
        
    }
    ///
    @IBAction func backTapped(_ sender: Any) {
        poptoViewController()
    }
    
    @IBAction func passCodeLockTapped(_ sender: Any) {
    }
    @IBAction func twoStepVarification(_ sender: Any) {
    }
    
    

}
