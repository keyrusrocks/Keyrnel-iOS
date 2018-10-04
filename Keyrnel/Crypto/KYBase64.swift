//
//  KYBase64.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 11/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import UIKit

/// Convert string or data into or from base 64
class KYBase64: KYBaseConverterProtocol {

    /// Convert a string in the specific base into a regular string.
    ///
    /// - Parameter baseString: The base string.
    /// - Returns: Converted string or nil.
    func string(baseString: String) -> String? {
        guard let decodedData = Data(base64Encoded: baseString) else {
            return nil
        }

        return String(data: decodedData, encoding: .utf8)
    }

    /// Convert a string in the specific base into a regular string.
    ///
    /// - Parameter baseData: The base data.
    /// - Returns: Converted data or nil.
    func data(baseData: Data) -> Data? {
        let decoded = String(data: baseData, encoding: .utf8)!

        return Data(base64Encoded: decoded)
    }

    /// Convert a regular string into a based string.
    ///
    /// - Parameter string: Regular string.
    /// - Returns: Converted string or nil.
    func stringBase(string: String) -> String? {
        return string.data(using: .utf8)!.base64EncodedString()
    }

    /// Convert a regular data into a based data.
    ///
    /// - Parameter data: Regular data.
    /// - Returns: Converted data or nil.
    func dataBase(data: Data) -> Data? {
        return data.base64EncodedData()
    }
}
