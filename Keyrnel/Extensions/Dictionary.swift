//
//  Dictionary.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 28/06/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import Foundation

// MARK: - Extension for Dictionary class
public extension Dictionary {

    /// Allow the + on dictionary class
    ///
    /// - Parameters:
    ///   - left: The left element to add
    ///   - right: The right element to add
    /// - Returns: A dictionnary who contains the two given dictionary
    public static func + (left: Dictionary, right: Dictionary) -> Dictionary {
        var map = Dictionary()

        for (t, u) in left {
            map[t] = u
        }

        for (t, u) in right {
            map[t] = u
        }

        return map
    }

    /// Allow the += on dictionary class
    ///
    /// - Parameters:
    ///   - left: The left element. He will be modified. Cannot be `let` 
    ///   - right: The right element to add
    public static func += ( left: inout Dictionary, right: Dictionary) {
        for (t, u) in right {
            left[t] = u
        }
    }
}
