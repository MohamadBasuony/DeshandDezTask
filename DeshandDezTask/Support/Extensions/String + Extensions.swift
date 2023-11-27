//
//  String + Extensions.swift
//  SellerApp
//
//  Created by Mohamad Basuony on 12/10/2022.
//

import Foundation
import UIKit
import CoreData

extension String {
    func date(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self)
    }

    func getTimeFormatted() -> String {
        let dateString = self.split(separator: ".").first ?? ""
        let date = "\(dateString)".date(withFormat: "yyyy-MM-dd'T'HH:mm:ss")
        let relativeDateFormatter = DateFormatter()
        relativeDateFormatter.dateStyle = .short
        return relativeDateFormatter.string(from: date ?? Date())
    }

    func getDateFormatted() -> String {
        let date = self.date(withFormat: "yyyy-MM-dd")
        let relativeDateFormatter = DateFormatter()
        relativeDateFormatter.dateStyle = .medium
        relativeDateFormatter.doesRelativeDateFormatting = true
        return relativeDateFormatter.string(from: date ?? Date())
    }

    var localized: String {
        return Bundle.main.localizedString(forKey: self, value: "Not Found", table: nil)
    }
}
