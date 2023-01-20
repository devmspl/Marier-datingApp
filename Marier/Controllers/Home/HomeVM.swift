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

//MARK: - setFilter api
    func addFilterApi(completion:@escaping(Bool,String)->()){
        
        let params: [String:Any] = ["location": location,
                                    "ageRange":selectedAgeRange,
                                    "sexType":sexType,
                                    "distance":distance,
                                    "language":"English"]
        let para: [String:Any] = ["setting": params]
        ApiManager.shared.hitApis(requestUrl: ApiUrls.updateUser+getUserId(), httpMethod: .put, requestBody: para) { result, statusCode, isSuccess, error in
            if isSuccess{
                completion(isSuccess,"")
            }else{
                completion(isSuccess,error)
            }
        }
    }
//MARK: - cardData
    func dataForCard(){
        if swipeCardData.count > 0{
            for i in 0...swipeCardData.count-1{
                if let img = swipeCardData[i].avatar as? String{
                    let url = URL(string: img)
                    if url != nil{
                        self.cardData.append(SwipeViewData(image: url!, nameDate: "\(swipeCardData[i].name), \(calculateAge(birthday: swipeCardData[i].dob))", location: swipeCardData[i].sex))
                    }else{
                        let url = getGalleryImage()
                        if url != nil{
                            self.cardData.append(SwipeViewData(image: url, nameDate: swipeCardData[i].name, location: swipeCardData[i].sex))
                        }else{
                            self.cardData.append(SwipeViewData(image: nil, nameDate: swipeCardData[i].name, location: swipeCardData[i].sex))
                        }
                    }
                }
            }
        }
    }
    
//MARK: - getGalleryImage
    func getGalleryImage()->URL?{
        var imageUrl: URL?
        for i in 0...swipeCardData.count-1{
            let img = swipeCardData[i].gallery[0].image
            imageUrl = URL(string: img)
        }
        return imageUrl
    }
    
//MARK: - setDrop down text
    func setDropDownText(textField: UITextField)->String{
        
        self.distance = GetDistance().getDist(drop: dropDown, view: textField, dropArray: distanceArray)
        
        return "\(distance) KM"
    }
//MARK: - 
}

