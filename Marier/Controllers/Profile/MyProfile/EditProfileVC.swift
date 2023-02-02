//
//  EditProfileVC.swift
//  Marier
//
//  Created by MacBook M1 on 11/01/23.
//

import UIKit
import RangeSeekSlider

class EditProfileVC: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var languageBtn: UIButton!
    @IBOutlet weak var showMeBtn: UIButton!
    @IBOutlet weak var selectedAge: UILabel!
    @IBOutlet weak var maximumDistance: UILabel!
    @IBOutlet weak var ageSelect: RangeSeekSlider!
    @IBOutlet weak var distanceSelect: RangeSeekSlider!
    
    var userData: UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    ///
    //MARK: - private Functions
    private lazy var viewModel: ProfileVM = {
        return ProfileVM()
    }()
    
    ///
    
    @IBAction func backTapped(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func saveTapped(_ sender: UIButton){
        viewModel.updateProfile(profileModel: saveData()) { isSuccess, error in
            if isSuccess{
                self.showAlertWithOneAction(alertTitle: "Profile Update", message: "Profile successfully updated", action1Title: "Ok") { ok in
                    self.poptoViewController()
                }
            }else{
                self.alert(message: error)
            }
        }
        
    }
    
    func saveData()->EditProfileModel{
        let editDataModel = EditProfileModel(name: name.text!,
                                             dob: dob.text!,
                                             location: (userData?.setting?.location)!,
                                             language: userData?.setting?.language ?? "english",
                                             showMe: userData?.setting?.sexType ?? "female",
                                             ageRange: (userData?.setting?.ageRange)!,
                                             distance: userData?.setting?.distance ?? 10)
        return editDataModel
    }
    
    func getData(){
        name.text = userData?.name
        dob.text = userData?.dob
//        locationBtn.setTitle(userData?.setting?.location, for: .normal)
        languageBtn.setTitle(userData?.setting?.language.capitalized, for: .normal)
        showMeBtn.setTitle(userData?.setting?.sexType.capitalized, for: .normal)
        selectedAge.text = "\(userData?.setting?.ageRange?.from ?? 20) - \(userData?.setting?.ageRange?.to ?? 35)"
        maximumDistance.text = "\(userData?.setting?.distance ?? 15)"
        
    }

}
