//
//  ErrorModel.swift
//  REFD-Customer
//
//  Created by Mohamad Basuony on 24/08/2023.
//

import Foundation
// MARK: - ErrorModel
class ErrorsModel: Codable {
    var statusCode: Int?
    var message : String?
    var errors: [ErrorModel]?
    var errorType, path: String?
    var status: Bool?
    var timeStamp: String?
}

// MARK: - Error
class ErrorModel: Codable {
    var message: String?
    var isVerified: Bool?

    enum CodingKeys: String, CodingKey {
        case message
        case isVerified = "is_verified"
    }
}
