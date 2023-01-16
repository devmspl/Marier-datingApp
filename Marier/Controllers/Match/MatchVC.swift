//
//  MatchVC.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import UIKit

class MatchVC: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var nearbyButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        loadData()
        // Do any additional setup after loading the view.
    }
    
    
    //
    func loadData(){
        mainView.addSubview(viewModel.addSearchView(view: "search").view)
    }
    //MARK: - private functions
    private lazy var viewModel: MatchVM = {
        return MatchVM()
    }()
    
    @IBAction func searchTapped(_ sender: UIButton){
        searchButton.setTitleColor(UIColor.black, for: .normal)
        nearbyButton.setTitleColor(UIColor.gray, for: .normal)
        mainView.addSubview(viewModel.addSearchView(view: "search").view)
//        myView.addSubview(myViewController.view)
    }
    @IBAction func nearbyTapped(_ sender: UIButton){
        searchButton.setTitleColor(UIColor.gray, for: .normal)
        nearbyButton.setTitleColor(UIColor.black, for: .normal)
        mainView.addSubview(viewModel.addSearchView(view: "nearby").view)
    }
   
}
