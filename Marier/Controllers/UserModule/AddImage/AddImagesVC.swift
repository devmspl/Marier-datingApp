//
//  AddInterestsVC.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit
import OpalImagePicker
import Photos

class AddImagesVC: BaseClass {
   

    @IBOutlet weak var picCollection: UICollectionView!
    
    var picker = OpalImagePickerController()
    var configuration = OpalImagePickerConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.imagePickerDelegate = self
        picker.maximumSelectionsAllowed = 4
        picker.allowedMediaTypes = Set([PHAssetMediaType.image])
        configuration.maximumSelectionsAllowedMessage = NSLocalizedString("You can select that only six images!", comment: "")
        picker.configuration = configuration
    }
    //MARK: - private function/////
    internal lazy var viewModel: AddImageVM = {
        return AddImageVM()
    }()
    //MARK: - actions////////////
    @IBAction func onBackTap(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func onContinueTap(_ sender: UIButton){
        viewModel.uploadImageApi { [self] isSuccess, error in
            if isSuccess{
                let vc = storyBoards.TabBar.instantiateViewController(withIdentifier: "BottomBar") as! BottomBar
                self.pushVC(controller: vc)
            }else{
                alert(message: error)
            }
        }
       
    }

}

