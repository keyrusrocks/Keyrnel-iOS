//
//  String.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 01/03/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import Foundation

// MARK: - Extension for String class
public extension String {

    /// Get the name of the given class
    ///
    /// - Parameter aClass: The class
    /// - Returns: An optional string for the given class
    public static func className(_ aClass: Any) -> String? {
        guard let clazz = type(of: aClass) as? AnyClass, Mirror(reflecting: aClass).displayStyle == .class else {
            return nil
        }

        let className = NSStringFromClass(clazz)
        return className.components(separatedBy: ".").last
    }

    /// Capitalize first letter of self
    public var capitalizeFirstLetter: String {
        let first = String(prefix(1)).capitalized
        let other = String(dropFirst())

        return first + other
    }

    /// Return nil if self is empty
    public var emptyToNil: String? {
        if self.isEmpty { return nil }
        return self
    }

    /// Check if password is valid
    ///
    /// - Parameter password: the password to check
    /// - Returns: the boolean
    public static func isValid(password: String) -> Bool {
        if password.rangeOfCharacter(from: CharacterSet.letters) == nil { return false }
        if password.count < 8 { return false }

        return true
    }

    /// Check if email is valid
    ///
    /// - Parameter mail: the mail to check
    /// - Returns: the boolean
    public static func isValid(mail: String?) -> Bool {

        guard let email = mail else {
            return false
        }

        let mailRegex: String = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,6}$"
        let predicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", mailRegex)

        return predicate.evaluate(with: email)
    }

    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }

    // Generate a random Hex String
    // TODO : To be tested
    public static func randomHexString(length: Int) -> String {
        let letters: NSString = "0123456789ABCDEF"
        let len = UInt32(letters.length)

        var randomString = ""

        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }

        return randomString
    }
}
