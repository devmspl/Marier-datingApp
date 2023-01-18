//
//  AddInterestVC.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import UIKit
import MaterialComponents
import AlignedCollectionViewFlowLayout

class AddInterestVC: UIViewController {

    @IBOutlet weak var chipCollection: UICollectionView!
    @IBOutlet weak var interestView: UIView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
      
        getData()
    }
    //Load view
    override func loadView() {
      super.loadView()
        chipCollection.isMultipleTouchEnabled = true
        let alignedFlowLayout = chipCollection?.collectionViewLayout as? AlignedCollectionViewFlowLayout
         alignedFlowLayout?.horizontalAlignment = .left
         alignedFlowLayout?.verticalAlignment = .top
      chipCollection.register(
          UINib(nibName: "ChipCollectionCell", bundle: nil),
          forCellWithReuseIdentifier: "ChipCollectionCell")
    }
   
    //MARK: - private functions
    lazy var viewModel: AddInterestVM = {
        AddInterestVM()
    }()
    //MARK: - apicalll///
    func getData(){
        viewModel.getInterestsApi { isSuccess, error in
            if isSuccess{
                self.chipCollection.reloadData()
            }else{
                self.alert(message: error)
            }
        }
    }
    
    //MARK: - actions
    @IBAction func onBackTap(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func onContinueTap(_ sender: UIButton){
        
        viewModel.addInterests { isSuccess, error in
            if isSuccess{
                let vc = storyBoards.Main.instantiateViewController(withIdentifier: "AddImagesVC") as! AddImagesVC
                self.pushVC(controller: vc)
            }else{
                self.alert(message: error)
            }
        }
      
    }
}
