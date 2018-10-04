//
// Array.swift
// Keyrnel
//
// Created by Nicolas Lourenco on 03/07/2017
//
// Copyright © 2017 Keyrus. All rights reserved.
//

import Foundation

// MARK: - Extension for Array class
public extension Array where Element: Equatable {

    /// Remove first collection element that is equal to the given `object`:
    ///
    /// - Parameter object: The object
    public mutating func remove(_ item: Element) {
        if let index = index(of: item) {
            remove(at: index)
        }
    }
}
