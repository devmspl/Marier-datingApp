//
//  HomeVM.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation
import Koloda
import AlamofireImage
import DropDown

class HomeVM: NSObject{
    
    var swipeCardData = [RandomListModel]()
    var cardData = [SwipeViewData]()
    var selectedAgeRange = AgeRange(to: 20, from: 30)
    var sexType = ""
    var location = Location(type: "Point", coordinates: [75.75,74.5])
    var distance = 10
    var distanceArray = ["10","20","30","50","100"]
    var dropDown = DropDown()
    ///
    ///
//MARK: - getMatchList api call
    func getMatchList(completion:@escaping(Bool,String)->()){
        ApiManager.shared.getDataApi(requestUrl: ApiUrls.getRandomList+getUserId(), httpMethod: .get, resultType: BaseResponse<[RandomListModel]>.self) { [self] result, statusCode, isSuccess, error in
            if isSuccess{
                self.swipeCardData = (result?.data!)!
                dataForCard()
                completion(isSuccess,"")
            }else{
                completion(false,error)
            }
        }
    }
///
    ///
    ///
//MARK: - setFilter api
    func addFilterApi(completion:@escaping(Bool,String)->()){
        let requestBody = UserSettings(location: location, ageRange: selectedAgeRange, sexType: sexType, distance: distance, language: "language")
        ApiManager.shared.hitApis(requestUrl: ApiUrls.updateUser+getUserId(), httpMethod: .put, requestBody: requestBody) { result, statusCode, isSuccess, error in
            if isSuccess{
                completion(isSuccess,"")
            }else{
                completion(isSuccess,error)
            }
        }
    }
    ///
    ///
    ///
//MARK: - like user api
    func likeUserApi(requestBody: LikeRequestModel,completion:@escaping(Bool,String)->()){
        ApiManager.shared.hitApis(requestUrl: ApiUrls.likeUser, httpMethod: .post, requestBody: requestBody) { result, statusCode, isSuccess, error in
            if isSuccess{
                completion(isSuccess,"")
            }else{
                completion(isSuccess,error)
            }
        }
    }
    ///
    ///
//MARK: - cardData
    func dataForCard(){
        if swipeCardData.count > 0{
            for i in 0...swipeCardData.count-1{
                if let img = swipeCardData[i].avatar as? String{
                    let url = URL(string: img)
                    if url != nil{
                        self.cardData.append(SwipeViewData(image: url!, nameDate: "\(swipeCardData[i].name), \(calculateAge(birthday: swipeCardData[i].dob))", location: swipeCardData[i].sex.capitalized))
                    }else{
                        let url = getGalleryFirstImage(gallery: swipeCardData[i].gallery)
                        if url != nil{
                            self.cardData.append(SwipeViewData(image: url, nameDate: "\(swipeCardData[i].name), \(calculateAge(birthday: swipeCardData[i].dob))", location: swipeCardData[i].sex.capitalized))
                        }else{
                            self.cardData.append(SwipeViewData(image: nil, nameDate:"\(swipeCardData[i].name), \(calculateAge(birthday: swipeCardData[i].dob))", location: swipeCardData[i].sex.capitalized))
                        }
                    }
                }
            }
        }
    }
   ///
    ///
    ///
//MARK: - getGalleryImage
 
    ///
    ///
    ///
//MARK: - setDrop down text
    func setDropDownText(textField: UITextField){
        dropDown.show()
        dropDown.anchorView = textField
        dropDown.dataSource = distanceArray
        dropDown.selectionAction = { [unowned self] (index: Int,Item: String) in
            distance = Int(Item) ?? 10
            textField.text = Item + " KM"
            dropDown.hide()
        }
    }
//MARK: - 
}

