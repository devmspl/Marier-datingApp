//
//  UserDataModel.swift
//  Marier
//
//  Created by MacBook M1 on 17/01/23.
//

import Foundation

// MARK: - userDATA
struct UserData: Codable {
    let id, name, email, sex: String
    let phoneNumber: Int
    let dob, status: String
    let loc: String?
    let sexualOrientations: [OrientationAndInterestDataModel?]
    let avatar: String
    let interests: [OrientationAndInterestDataModel?]
    let socialLogin: SocialLogin?
    let setting: UserSettings?
    let createdAt, updatedAt: String
    let gallery: [UserGallery?]
    
    enum CodingKeys: String,CodingKey{
        case avatar
        case sexualOrientations
        case phoneNumber
        case interests
        case socialLogin
        case setting, gallery
        case createdAt, updatedAt, status, email, name, sex, dob, loc ,id
    }
}

// MARK: - Setting
struct UserSettings: Codable {
    let location: Location?
    let ageRange: AgeRange?
    let sexType: String
    let distance: Int
    let language: String
    
    enum CodingKeys: String,CodingKey{
        case location, ageRange, sexType, distance, language
    }
}

// MARK: - AgeRange
struct AgeRange:Codable {
    let to, from: Int
    enum CodingKeys: String,CodingKey{
        case to,from
    }
}

// MARK: - Location
struct Location:Codable {
    let type: String
    let coordinates: [Double]
    
    enum CodingKeys: String,CodingKey{
        case type
        case coordinates
    }
}

// MARK: - SocialLogin
struct SocialLogin: Codable {
    let id, from: String
    
    enum CodingKeys: String,CodingKey{
        case id
        case from
    }

}

//MARK: - user gallery

struct UserGallery: Codable{
    let image,id: String
    
    enum CodingKeys: String,CodingKey{
        case image
        case id = "_id"
    }
    
}
