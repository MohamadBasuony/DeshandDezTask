//
//  LocalizationSystem.swift
//  Crisp-Demo
//
//  Created by Aman Aggarwal on 8/10/18.
//  Copyright © 2018 iostutorialjunction.com . All rights reserved.
//

import Foundation
import SwiftUI

class LocalizationManager:NSObject , ObservableObject {

    var bundle: Bundle!

    class var sharedInstance: LocalizationManager {
        struct Singleton {
            static let instance: LocalizationManager = LocalizationManager()
        }
        return Singleton.instance
    }

    @Published public var selectedLanguage: String = "ar"

    public var local: Locale {
      Locale(identifier: selectedLanguage)
    }
    override init() {
        super.init()
        bundle = Bundle.main
    }

    func localizedStringForKey(key:String, comment:String) -> String {
        return bundle.localizedString(forKey: key, value: comment, table: nil)
    }

    func localizedImagePathForImg(imagename:String, type:String) -> String {
        guard let imagePath =  bundle.path(forResource: imagename, ofType: type) else {
            return ""
        }
        return imagePath
    }

    func setLanguage(languageCode:String) {
        var appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String]
        appleLanguages?.remove(at: 0)
        appleLanguages?.insert(languageCode, at: 0)
        UserDefaults.standard.set(appleLanguages ?? [], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize() // needs restrat
        NotificationCenter.default.post(name: Notification.Name(rawValue: "changedLanguage"), object: nil)

        if let languageDirectoryPath = Bundle.main.path(forResource: languageCode, ofType: "lproj") {
            bundle = Bundle.init(path: languageDirectoryPath)
        } else {
            resetLocalization()
        }
    }

    func resetLocalization() {
        bundle = Bundle.main
    }

    func getLanguage() -> String {
        let appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String]
        let prefferedLanguage = appleLanguages?[0] ?? ""
        if prefferedLanguage.contains("-") {
            let array = prefferedLanguage.components(separatedBy: "-")
            return array[0]
        }
        return prefferedLanguage
    }

//   @Published var isArabic = isArabicLanguage()

    func isArabicLanguage () -> Bool {
        return Locale.preferredLanguages.first == "ar"
    }

    public var layout: LayoutDirection {
      isRightToLeft ? .rightToLeft : .leftToRight
    }

    /// The diriction of the language as boolean.
    public var isRightToLeft: Bool {
        return isArabicLanguage()
    }

    var uuid: String {
        return UUID().uuidString
    }
}
