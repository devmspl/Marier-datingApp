//
//  HomeVC.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit
import RangeSeekSlider
import DropDown


class HomeVC: UIViewController{
    
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var superLike: UIView!
    @IBOutlet public weak var dislikeView: UIView!
    @IBOutlet weak var segmentCtrl: UISegmentedControl!
    @IBOutlet weak var selectedDistance: UITextField!
    @IBOutlet weak var filterSubView: UIView!
    @IBOutlet var filterView: UIView!
    @IBOutlet weak var swipeView: KolodaView!
    @IBOutlet weak var ageRange: RangeSeekSlider!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeView.delegate = self
        swipeView.dataSource = self
        segmentCtrl.selectedSegmentIndex = 1
        viewModel.sexType = GetType().sexType(index: segmentCtrl.selectedSegmentIndex)
        setData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        filterView.removeFromSuperview()
        rangeSeekModify()
    }
    
//Age range modifications
    func rangeSeekModify(){
        filterView.frame = view.bounds
        filterSubView.layer.cornerRadius = 20
        filterSubView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        ageRange.delegate = self
    }
//MARK: - hideViews
    func hideViews(){
        dislikeView.isHidden = true
        likeView.isHidden = true
        superLike.isHidden = true
        
        
        likeView.tilt(degree: -4.0)
        dislikeView.tilt(degree: 4.0)
        
        dislikeView.setBorder(color: UIColor.systemRed)
        likeView.setBorder(color: UIColor.systemGreen)
        superLike.setBorder(color: UIColor.cyan)
    }
//MARK: - VIEWMODEL
    internal lazy var viewModel: HomeVM = {
        return HomeVM()
    }()
   
    //MARK: - SET DATA
    func setData(){
        hideViews()
        viewModel.getMatchList { [self] isSuccess, error in
            if isSuccess{
                viewModel.dataForCard()
                swipeView.reloadData()
            }else{
                alert(message: error)
            }
        }
    }
    
//MARK: - actions
    @IBAction func selectDistance(_ sender: Any) {
        viewModel.setDropDownText(textField: selectedDistance)
    }
    @IBAction func segmentChanged(_ sender: Any) {
        viewModel.sexType = GetType().sexType(index: segmentCtrl.selectedSegmentIndex)
    }
    @IBAction func filterTapped(_ sender: Any) {
        view.addSubview(filterView)
    }
    @IBAction func doneTapped(_ sender: Any) {
        filterView.removeFromSuperview()
        viewModel.addFilterApi { isSuccess, error in
            if isSuccess{
                self.setData()
            }else{
                self.alert(message: error)
            }
        }
    }
    @IBAction func backTapped(_ sender: Any) {
        filterView.removeFromSuperview()
    }
    @IBAction func disLikeTappped(_ sender: Any) {
        swipeView.swipe(.left)
    }
    @IBAction func superLiketapped(_ sender: Any) {
        swipeView.swipe(.up)
    }
    @IBAction func likeTapped(_ sender: Any) {
        swipeView.swipe(.right)
    }
}



