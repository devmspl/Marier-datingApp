//
//  UserDataModel.swift
//  Marier
//
//  Created by MacBook M1 on 17/01/23.
//

import Foundation

struct UserDatamodel {
    let isSuccess: Bool
    let statusCode: Int
    let data: UserData
    let message: String
}

// MARK: - DataClass
struct UserData {
    let id, name, email, sex: String
    let phoneNumber: Int
    let dob, loc, status: String
    let sexualOrientations: [Any?]
    let avatar: String
    let socialLogin: SocialLogin
    let setting: UserSettings
    let createdAt, updatedAt: String
}

// MARK: - Setting
struct UserSettings {
    let location: Location
    let ageRange: AgeRange
    let sexType: String
    let distance: Int
    let language: String
}

// MARK: - AgeRange
struct AgeRange {
    let to, from: Int
}

// MARK: - Location
struct Location {
}

// MARK: - SocialLogin
struct SocialLogin {
    let id, from: String
}
