//
//  ViewContactVC.swift
//  Marier
//
//  Created by MacBook M1 on 28/02/23.
//

import UIKit

class ViewContactVC: UIViewController {

    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var mediaCount: UILabel!
    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    
    
    @IBOutlet weak var disappearingMessageStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func customNotification(_ sender: Any) {
    }
    @IBAction func mediaVisibility(_ sender: Any) {
    }
    
    @IBAction func reportTapped(_ sender: Any) {
    }
    @IBAction func blockTaped(_ sender: Any) {
    }
    @IBAction func messageDisappear(_ sender: Any) {
    }
    @IBAction func encryptionTapped(_ sender: Any) {
    }
    @IBAction func switchTapped(_ sender: Any) {
    }
    @IBAction func backtapped(_ sender: Any) {
        poptoViewController()
    }
    
    @IBAction func optionTapped(_ sender: Any) {
    }
    
    @IBAction func mediaTapped(_ sender: Any) {
    }
    @IBAction func editStatus(_ sender: Any) {
    }
}
