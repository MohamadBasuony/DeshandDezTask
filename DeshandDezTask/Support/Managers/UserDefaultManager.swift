//
//  UserDefaultManager.swift
//  Seller App
//
//  Created by Mohamad Basuony on 06/09/2022.
//

import Foundation

enum UserDefaultsKeys: String, CaseIterable {
    case apiToken
}

struct UserDefaultsManager {
    static var shared: UserDefaultsManager = UserDefaultsManager()

    static var apiToken: String? {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.apiToken.rawValue)
        } set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.apiToken.rawValue)
        }
    }
}

extension UserDefaultsManager {
    func getValue(_ key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    func setValue(_ value: Any?, forKey key: String) {
        UserDefaults.init().set(value, forKey: key)
    }
    func removeValue(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    func removeAllUserDefaults() {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
    }
    func removeArrayOfKeys(keys: [UserDefaultsKeys]) {
        for key in keys {
            self.removeValue(key.rawValue)
        }
    }
    func setArrayOfValues<T>(value: [T], key: [String]) {
        for (value, key) in zip(value, key) {
            self.setValue(value, forKey: key)
        }
    }
    // save all object in user defaults
    func setObject<T>(forKey key: String, _ value: T?) where T: Encodable {
        if value == nil {
            UserDefaults.standard.set(nil, forKey: key)
        } else {
            do {
                let jsonEncoder = JSONEncoder()
                let jsonData = try jsonEncoder.encode(value!)
                let json = String(data: jsonData, encoding: String.Encoding.utf8)
                UserDefaults.standard.set(json, forKey: key)
            } catch let error {
                print("couldn't encode object:\(error)")
            }
        }
    }
    // save get object in user defaults
    func getObject<T: Codable>(_ key: String, result: T.Type) -> T? {
        do {
            let jsonString = getValue(key) as? String
            let jsonData = jsonString?.data(using: .utf8)
            let decoder = JSONDecoder()
            return try decoder.decode(result, from: jsonData ?? Data())
        } catch let error {
            print("couldn't decode object:\(error)")
        }
        return nil
    }
}
