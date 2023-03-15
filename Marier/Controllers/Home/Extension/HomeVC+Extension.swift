//
//  HomeVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation
import AlamofireImage
import KRProgressHUD
import RangeSeekSlider
import Toast

extension HomeVC: KolodaViewDelegate,KolodaViewDataSource{
    
//MARK: -DataSource functions
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        viewModel.getMatchList { [self] isSuccess, error in
            koloda.resetCurrentCardIndex()
            swipeView.reloadData()
        }
    }
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
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
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        viewModel.swipeCardData.count
    }
    
//MARK: - Delegate functions
    //SwipeResultSirection
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        let likeTo = viewModel.swipeCardData[index].id
      
        if direction == .left{
            print("userDisliked")
        }else if direction == .right{
            
            let requestData = LikeData().swipeDirection(likeTo: likeTo, direction: "right")
            viewModel.likeUserApi(requestBody: requestData) { isSuccess, error in
                if isSuccess{
                    print("userLiked")
                }else{
                    self.view.makeToast(error)
                }
            }

        }else if direction == .up{
            let requestData = LikeData().swipeDirection(likeTo: likeTo, direction: "up")
            viewModel.likeUserApi(requestBody: requestData) { isSuccess, error in
                if isSuccess{
                    print("userLiked")
                }else{
                    self.view.makeToast(error.capitalized)
                }
            }

        }
    }
    //Allowed directions
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.left,.right,.up]
    }
    //DidSelect
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        let vc = storyBoards.Profile.instantiateViewController(withIdentifier: "OtherUserProfileVC") as! OtherUserProfileVC
        vc.id = viewModel.swipeCardData[index].id
        self.pushVC(controller: vc)
    }
    func koloda(_ koloda: KolodaView, draggedCardWithPercentage finishPercentage: CGFloat, in direction: SwipeResultDirection) {
        if finishPercentage != 100.0{
            if direction == .right{
                likeView.isHidden = false
                dislikeView.isHidden = true
                superLike.isHidden = true
            }else if direction == .left{
                dislikeView.isHidden = false
                likeView.isHidden = true
                superLike.isHidden = true
            }else if direction == .up{
                likeView.isHidden = true
                dislikeView.isHidden = true
                superLike.isHidden = false
            }
        }else{
            self.hideViews()
        }
       
    }
    func kolodaDidResetCard(_ koloda: KolodaView) {
        self.hideViews()
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


