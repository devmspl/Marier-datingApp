//
//  PremiumVC.swift
//  Marier
//
//  Created by MacBook M1 on 02/03/23.
//

import UIKit

class PremiumVC: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var premiumBenifitsCollection: UICollectionView!
    @IBOutlet weak var premiumSelectionCollection: UICollectionView!
    @IBOutlet weak var timePeriod: UILabel!
    @IBOutlet weak var currentPlan: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func loadView() {
        super.loadView()
        premiumSelectionCollection.register(UINib(nibName: "SubscriptionCell", bundle: nil), forCellWithReuseIdentifier: "SubscriptionCell")
        premiumBenifitsCollection.register(UINib(nibName: "SubscriptionBenifitCell", bundle: nil), forCellWithReuseIdentifier: "SubscriptionBenifitCell")
    }
    @IBAction func backTapped(_ sender: Any) {
    }
    @IBAction func unsubscribeTapped(_ sender: Any) {
    }
    @IBAction func upgradeTapped(_ sender: Any) {
    }
    @IBAction func continueTapped(_ sender: Any) {
    }
}
