//
//  Sequence.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 29/05/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import Foundation

// MARK: - Extension for Sequence classes
public extension Sequence where Iterator.Element: Hashable {

    /// Filter a Sequence to remove duplicates
    ///
    /// - Returns: Return a sequence without duplicates
    public func unique() -> [Iterator.Element] {
        var seen: [Iterator.Element: Bool] = [:]

        return self.filter {
            seen.updateValue(true, forKey: $0) == nil
        }
    }

    func any(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        for element in self {
            if try predicate(element) {
                return true
            }
        }
        return false
    }

    func all(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        for element in self {
            if try !predicate(element) {
                return false
            }
        }
        return true
    }

    func none(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        return try !self.any(predicate)
    }

    func count(_ predicate: (Element) throws -> Bool) rethrows -> Int {
        var count = 0

        for element in self {
            if try predicate(element) {
                count += 1
            }
        }
        return count
    }

    var count: Int {
        var value = 0

        for _ in self {
            value += 1
        }

        return value
    }
}
