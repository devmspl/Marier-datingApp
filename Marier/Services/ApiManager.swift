//
//  ApiManager.swift
//  Marier
//
//  Created by MacBook M1 on 13/01/23.
//

import Foundation
import Alamofire
import KRProgressHUD

enum RequestMethod: String{
    case get
    case post
    case delete
    case put
}

class ApiManager
{
    ///
    ///
    public static let shared = ApiManager()
    ///
    ///
    ///
    func getDataApi<T:Codable>(requestUrl: String,httpMethod: HTTPMethod,resultType:T.Type,completion: @escaping(_ result: T?,_ statusCode: Int,_ isSuccess: Bool,_ error: String)->()){
        KRProgressHUD.show()
        if ReachabilityNetwork.isConnectedToNetwork(){
            AF.request(requestUrl,method: httpMethod,headers: sendheader()).response{
                response in
                switch response.result{
                    
                case .success(let data):do{
                    KRProgressHUD.dismiss()
                     let json =  try? JSONDecoder().decode(T.self, from: data!)
                    let res = try! JSONSerialization.jsonObject(with: data!,options: .mutableContainers) as! [String:Any]
                    let status = response.response?.statusCode
                    if status == 200{
                        completion(json,status!,true,"")
                    }else{
                        let json = try! JSONSerialization.jsonObject(with: data!,options: .mutableContainers) as! [String:Any]
                        let errorMessage = json["message"] as! String
                        completion(nil,status!,false,errorMessage)
                    }
                }
                case .failure(let error):do{
                    KRProgressHUD.dismiss()
                    completion(nil,400,false,error.localizedDescription)
                }
                }
            }
            
        }else{
            completion(nil,504,false,"Please check internet connection")
        }
    }
    
    ///
    ///
    ///
    
 func hitApis(requestUrl: String, httpMethod: HTTPMethod, requestBody: [String:Any], completionHandler:@escaping(_ result:[String:Any] , _ statusCode: Int, _ isSuccess: Bool, _ error: String)-> Void){
        KRProgressHUD.show()
        if ReachabilityNetwork.isConnectedToNetwork(){
            AF.request(requestUrl,method: httpMethod,parameters: requestBody,encoding: JSONEncoding.default,headers: sendheader()).response{
                response in
                switch response.result{
                    
                case .success(let data):do{
                    KRProgressHUD.dismiss()
                    let status = response.response?.statusCode
                    guard let json = try? JSONSerialization.jsonObject(with: data!,options: .mutableContainers) as? [String:Any] else {return}
                    if status == 200{
                        completionHandler(json,status!,true,"")
                    }else{
                        let error = json["message"] as? String ?? "error"
                        completionHandler(json,status!,false,error)
                    }
                }
                case .failure(let error):do{
                    KRProgressHUD.dismiss()
                    completionHandler([:],400,false,error.localizedDescription)
                }
                    
                }
            }

        }else{
            KRProgressHUD.dismiss()
            completionHandler([:],504,false,"Please check internet connection")
        }
}
    
    ///
    ///
    func uploadMultipleImages(images: [UIImage],progress:@escaping(_ percent:Float)->(),completion:@escaping(_ result: Bool,_ message: String)->()){
        
             let randomno = Int.random(in: 1000...100000)
             let imgFileName = "image\(randomno).jpg"
        
        AF.upload(multipartFormData: { MultipartFormData in
            for i in 0...images.count-1{
                                                    
                    MultipartFormData.append(images[i].jpegData(compressionQuality: 0.8)!,
                                                             withName: "image",
                                                             fileName: imgFileName,
                                                             mimeType: "image/jpeg")
                                               
                                              }
        }, to: ApiUrls.ulpoadGalleryImages+getUserId(), usingThreshold: UInt64.init(), method: .put).uploadProgress { process in
            progress(Float(process.fractionCompleted))
        }.response { response in
            debugPrint(response)
        }
    }
    ///
    ///
    
    func sendheader() -> HTTPHeaders{

        var headers: HTTPHeaders {
            if let userAuthToken = getUserToken() as? String {
                return ["x-access-token":userAuthToken]
            }
            return ["Content-Type": "application/json"] // + aDictMetaData
        }
        return headers
    }
}
