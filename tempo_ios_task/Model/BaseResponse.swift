//
//  BaseResponse.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import Foundation

//MARK: - Base Response
class BaseResponse<T: Codable>: Codable {
    var status: String?
    var code: String?
    var totalResults: Int?
    var message: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case code = "code"
        case totalResults = "totalResults"
        case message = "message"
        case data = "articles"
    }
}
