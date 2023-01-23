//
//  ProfileVC.swift
//  Marier
//
//  Created by MacBook M1 on 11/01/23.
//

import UIKit

class ProfileVC: BaseClass {
    
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var currentPlan: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var showMeGender: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var ageRange: UILabel!
    @IBOutlet weak var language: UILabel!
    ///
    ///
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    ///
    ///
    //MARK: - privateFunctions////
    private lazy var viewModel: ProfileVM = {
        return ProfileVM()
    }()
    private var userData: UserData?
    
    //getUserDataFunction
    private func getData(){
        viewModel.getProfileData { [self] isSuccess, result, error in
            if isSuccess{
                userData = result
                setData()
            }else{
                alert(message: error)
            }
        }
    }
    ///
    func setData(){
        self.dateOfBirth.text = userData?.dob
        self.currentPlan.text = "Current Plan(Free)"
        self.email.text = "\(userData?.name ?? "")@gmail.com"
        self.nameLabel.text = userData?.name
        self.name.text = userData?.name
        self.number.text = "\(userData?.phoneNumber ?? 9807654321)"
        self.location.text = "Mohali"
        self.language.text = userData?.setting?.language
        self.showMeGender.text = userData?.setting?.sexType
        self.ageRange.text = "\(userData?.setting?.ageRange?.from ?? 22)-\(userData?.setting?.ageRange?.to ?? 35)"
        self.distance.text = "\(userData?.setting?.distance ?? 50) KM"
    }
    ///
    //MARK: - actions/////
    @IBAction func selectPhoto(_ sender: UIButton){
        openCameraAndPhotos(isEditImage: true) { image, message in
            self.profileImage.image = image
            print(message)
        } failure: { error in
            print(error)
        }

    }
    
    @IBAction func deleteAccountTapped(_ sender: Any) {
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        let vc = storyBoards.Main.instantiateViewController(withIdentifier: "LandingVC") as! LandingVC
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "token")
        self.pushVC(controller: vc)
    }
    
    @IBAction func changePlanTapped(_ sender: Any) {
    }
    
    @IBAction func editTapped(_ sender: UIButton){
        let vc = storyBoards.Profile.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        self.pushVC(controller: vc)
    }
    
}
