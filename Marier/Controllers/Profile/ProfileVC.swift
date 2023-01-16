//
//  ProfileVC.swift
//  Marier
//
//  Created by MacBook M1 on 11/01/23.
//

import UIKit

class ProfileVC: BaseClass {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func selectPhoto(_ sender: UIButton){
        openCameraAndPhotos(isEditImage: true) { image, message in
            self.profileImage.image = image
            print(message)
        } failure: { error in
            print(error)
        }

    }
    
    @IBAction func editTapped(_ sender: UIButton){
        let vc = storyBoards.Profile.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        self.pushVC(controller: vc)
    }
    
}
