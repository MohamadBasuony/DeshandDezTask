//
//  UIDate+Extension.swift
//  SellerApp
//
//  Created by Mohamad Basuony on 24/09/2022.
//

import Foundation
import UIKit

extension Date {
    func dateFormatTimeToString(format:String = "dd/MM/yyyy") -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = format
         return dateFormatter.string(from: self)
     }

    func getDateFormatted() -> String {
        let date = self
        let relativeDateFormatter = DateFormatter()
        relativeDateFormatter.timeStyle = .short
        relativeDateFormatter.dateStyle = .short
        relativeDateFormatter.doesRelativeDateFormatting = true
        return relativeDateFormatter.string(from: date)
    }

    func formatDate(format : String = "dd/MM/yyyy") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateStr = dateFormatter.string(from: self)
        return dateFormatter.date(from: dateStr)!
    }

    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
         return calendar.dateComponents(Set(components), from: self)
     }

     func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
         return calendar.component(component, from: self)
     }

    func compareDate(date : Date) -> Bool {
        let result = Calendar.current.compare(self, to: date, toGranularity: .month)
        return result == .orderedDescending
    }
}
