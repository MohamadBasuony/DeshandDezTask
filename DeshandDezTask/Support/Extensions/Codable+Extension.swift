//
//  Codable+Extension.swift
//  SellerApp
//
//  Created by Mohamad Basuony on 16/02/2023.
//

import Foundation

struct JSON {
    static let encoder = JSONEncoder()
}

extension Encodable {
    var asDictionary : [String:Any] {
      let mirror = Mirror(reflecting: self)
      let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
        guard let label = label else { return nil }
        return (label, value)
      }).compactMap { $0 })
      return dict
    }
}
