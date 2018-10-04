//
//  KYUserDefaults.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 12/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import UIKit

/// Embed a custom user defaults for Keyrus usage
class KYUserDefaults: NSObject {

    private let defaults: UserDefaults = UserDefaults(suiteName: "com.keyrus.keyrnel")!
    private var cryptor: KYEncryptionProtocol?
    private let defaultVersion = 1
    private let defaultVersionKey = "com.keyrus.defaults.version"

    /// Build the storage
    ///
    /// - Parameter cryptor: Standard cryptor (optional).
    required init(cryptor: KYEncryptionProtocol?) {
        super.init()

        defaults.set(defaultVersion, forKey: defaultVersionKey)

        // Cryptor can be nil.
        self.cryptor = cryptor
    }

    /// Retrieve the value for the given key.
    ///
    /// - Parameter key: The stored key for that value.
    /// - Returns: The value or nil.
    func object(forKey defaultName: String) -> Any? {
        var value = self.defaults.object(forKey: defaultName)

        // Treat only strings.
        if let cryptor = self.cryptor, let val = value as? String {
            if !val.isEmpty {
                value = cryptor.decrypt(string: val)
            } else {
                value = nil
            }
        }

        return value
    }

    /// Change the value for a given key.
    ///
    /// - Parameters:
    ///   - value: The value to save.
    ///   - key: The stored key for that value.
    func set(value: Any, forKey defaultName: String) {
        var val: Any = value

        if let cryptor = self.cryptor, let aValue = val as? String {
            val = cryptor.encrypt(string: aValue) ?? value
        }

        self.defaults.set(val, forKey: defaultName)
    }

    /// Remove the value and the key.
    ///
    /// - Parameter key: The stored key for that value.
    func removeObject(forKey defaultName: String) {
        self.defaults.removeObject(forKey: defaultName)
        self.defaults.synchronize()
    }

    /// Save a custom object implementing NSCoding.
    ///
    /// - Parameters:
    ///   - customObject: An object implementing NSCoding
    ///   - key: The stored key for that value.
    /// - Returns: Succeed status
    @discardableResult func save(customObject: Any, forKey defaultName: String) -> Bool {

        if Mirror(reflecting: customObject).displayStyle == .struct ||
            Mirror(reflecting: customObject).displayStyle == .enum ||
            Mirror(reflecting: customObject).displayStyle == .tuple {
            return false
        }

        let encodedObject: Data = NSKeyedArchiver.archivedData(withRootObject: customObject)
        self.defaults.set(encodedObject, forKey: defaultName)

        return true
    }

    /// Load a custom object implementing NSCoding.
    ///
    /// - Parameter key: The stored key for that value.
    /// - Returns: The value or nil.
    func load(key: String) -> Any? {
        guard let encodedObject: Data = self.defaults.object(forKey: key) as? Data else {
            return nil
        }

        return NSKeyedUnarchiver.unarchiveObject(with: encodedObject)
    }
}
