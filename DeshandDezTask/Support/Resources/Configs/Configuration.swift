//
//  Configuration.swift
//  BeutiCustomer
//
//  Created by Michele on 10/3/19.
//  Copyright © 2019 Michelle. All rights reserved.
//

import Foundation

public enum EnvConfiguration {

    private static let infoDictionary: [String: Any] = {
      guard let infoDict = Bundle.main.infoDictionary else {
        fatalError("info.Plist file not found")
      }
      return infoDict
    }()

    static var baseURL: String {
        guard let baseURLstring = EnvConfiguration.infoDictionary["BASE_URL"] as? String,
            !baseURLstring.isEmpty else {
        fatalError("Base URL not set in plist for this environment")
      }
      return baseURLstring
    }
}
