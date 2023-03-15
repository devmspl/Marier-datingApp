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
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        Container().addController(type: "likes", mainController: self, containerView: mainView)
        searchButton.setTitleColor(UIColor(named: "upperGradientColor"), for: .normal)
        nearbyButton.setTitleColor(UIColor(named: "lowerGradientColor"), for: .normal)
    }

    //MARK: - private functions
    private lazy var viewModel: MatchVM = {
        return MatchVM()
    }()
    
    @IBAction func searchTapped(_ sender: UIButton){
        searchButton.setTitleColor(UIColor(named: "upperGradientColor"), for: .normal)
        nearbyButton.setTitleColor(UIColor(named: "lowerGradientColor"), for: .normal)
        Container().addController(type: "likes", mainController: self, containerView: mainView)
    }
    @IBAction func nearbyTapped(_ sender: UIButton){
        searchButton.setTitleColor(UIColor(named: "lowerGradientColor"), for: .normal)
        nearbyButton.setTitleColor(UIColor(named: "uppersGradientColor"), for: .normal)
        Container().addController(type: "nearby", mainController: self, containerView: mainView)
        
    }
   
}
