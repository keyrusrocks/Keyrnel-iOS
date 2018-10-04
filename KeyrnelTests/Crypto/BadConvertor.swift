//
//  BadConvertor.swift
//  KeyrnelTests
//
//  Created by Nicolas Lourenco on 12/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import UIKit
@testable import Keyrnel

class BadConvertor: KYBaseConverterProtocol {

    /// Convert a string in the specific base into a regular string.
    ///
    /// - Parameter baseString: The base string.
    /// - Returns: Converted string or nil.
    func string(baseString: String) -> String? {
        return nil
    }

    /// Convert a string in the specific base into a regular string.
    ///
    /// - Parameter baseData: The base data.
    /// - Returns: Converted data or nil.
    func data(baseData: Data) -> Data? {
        return nil
    }

    /// Convert a regular string into a based string.
    ///
    /// - Parameter string: Regular string.
    /// - Returns: Converted string or nil.
    func stringBase(string: String) -> String? {
        return nil
    }

    /// Convert a regular data into a based data.
    ///
    /// - Parameter data: Regular data.
    /// - Returns: Converted data or nil.
    func dataBase(data: Data) -> Data? {
        return nil
    }
}
