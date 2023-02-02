//
//  BaseResponse.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation

struct BaseResponse<T:Codable>:Codable{
    var statusCode: Int?
    var message: String?
    var isSuccess: Bool?
    var data :T?
    var token: String?
}

struct loader{
    static func loadAPIResponse<T:Codable>(response: [String: Any],responseModel: T.Type) throws -> T {
        
        let data = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
        do {
            let stories = try JSONDecoder().decode(T.self, from: data)
            return stories
        } catch {
            throw error
        }
    }
}
