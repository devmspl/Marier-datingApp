//
//  EditProfileVC.swift
//  Marier
//
//  Created by MacBook M1 on 11/01/23.
//

import UIKit

class EditProfileVC: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTapped(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func saveTapped(_ sender: UIButton){
        self.poptoViewController()
    }
    

}
