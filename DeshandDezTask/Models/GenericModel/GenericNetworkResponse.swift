//
//  GenericNetworkRespons.swift
//  REFD-Customer
//
//  Created by Mohamad Basuony on 24/08/2023.
//

import Foundation
class GenericNetworkResponse<T:Codable>: Codable {
    var data: T?
    var message: String?
    var status: Int?
}

