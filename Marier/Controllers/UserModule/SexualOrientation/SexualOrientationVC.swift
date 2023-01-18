//
//  SexualOrientationVC.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit

class SexualOrientationVC: UIViewController {

    @IBOutlet weak var orientationTable: UITableView!
    @IBOutlet weak var checkBoxBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Private Function//
     lazy var viewModel: SexualOrientationVM = {
        return SexualOrientationVM()
    }()
    
    private func loadData(){
        viewModel.getOrientationData {[self] isSuccess, error in
            if !(isSuccess){
                self.alert(message: error)
            }else{
                orientationTable.reloadData()
            }
        }
    }
    //MARK: - actions///
    @IBAction func onBackTap(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func checkBoxTap(_ sender: UIButton){
        
    }
    @IBAction func onContinueTapped(_ sender: UIButton){
        
            viewModel.apiCall(orientations: viewModel.selectedInterests) { isSuccess, error in
                if isSuccess{
                    let vc = storyBoards.Main.instantiateViewController(withIdentifier: "AddInterestVC") as! AddInterestVC
                    self.pushVC(controller: vc)
                }else{
                    self.alert(message: error)
                }
            }
        }
    }
    

    

