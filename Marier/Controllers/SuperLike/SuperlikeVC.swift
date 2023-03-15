//
//  SuperlikeVC.swift
//  Marier
//
//  Created by MacBook M1 on 27/02/23.
//

import UIKit

class SuperlikeVC: UIViewController {

    @IBOutlet weak var superLikeText: UILabel!
    @IBOutlet weak var superStars: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gotItTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
