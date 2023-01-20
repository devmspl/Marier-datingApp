//
//  HomeVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation
import Koloda
import AlamofireImage
import RangeSeekSlider

extension HomeVC: KolodaViewDelegate,KolodaViewDataSource{
    
//MARK: -DataSource functions
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        viewModel.getMatchList { [self] isSuccess, error in
            koloda.resetCurrentCardIndex()
            swipeView.reloadData()
        }
    }
    func koloda(_ koloda: Koloda.KolodaView, viewForCardAt index: Int) -> UIView {
        let nibView = Bundle.main.loadNibNamed("SwipeView", owner: self, options: nil)?[0] as! SwipeView
        if viewModel.cardData[index].image != nil{
            nibView.userImage.af.setImage(withURL: viewModel.cardData[index].image!)
        }else{
            nibView.userImage.image = UIImage(named: "1")
        }
        nibView.userName.text = viewModel.cardData[index].nameDate
        nibView.distanceLabel.text = viewModel.cardData[index].location
        return nibView
    }
    
    func kolodaNumberOfCards(_ koloda: Koloda.KolodaView) -> Int {
        viewModel.swipeCardData.count
    }
    
//MARK: - Delegate functions
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        if direction == .left{
            
        }else if direction == .right{
            
        }else if direction == .up{
            
        }
    }
    
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.left,.right,.up]
    }
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("selected")
    }
    
}

//MARK: - range seek
extension HomeVC: RangeSeekSliderDelegate{
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        print("slider.minValue,slider.maxValue")
    }
    
    func didStartTouches(in slider: RangeSeekSlider) {
        print("slider.minValue,slider.maxValue")
    }
    
    func didEndTouches(in slider: RangeSeekSlider) {
        viewModel.selectedAgeRange = AgeRange(to: Int(slider.selectedMaxValue), from: Int(slider.selectedMinValue))
    }
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, stringForMinValue minValue: CGFloat) -> String? {
      return "\(minValue)"
    }
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, stringForMaxValue: CGFloat) -> String? {
        return "\(stringForMaxValue)"
    }
}
