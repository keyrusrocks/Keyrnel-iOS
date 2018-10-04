//
//  KYBaseConverterProtocol.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 06/11/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import UIKit

/// KYBaseConverterProtocol
/// Convertor from a base to another.
/// Protocol for all base contertors.
protocol KYBaseConverterProtocol {

    /// Convert a string in the specific base into a regular string.
    ///
    /// - Parameter baseString: The base string.
    /// - Returns: Converted string or nil.
    func string(baseString: String) -> String?

    /// Convert a data in the specific base into a regular data.
    ///
    /// - Parameter baseData: The base data.
    /// - Returns: Converted data or nil.
    func data(baseData: Data) -> Data?

    /// Convert a regular string into a based string.
    ///
    /// - Parameter string: Regular string.
    /// - Returns: Converted string or nil.
    func stringBase(string: String) -> String?

    /// Convert a regular data into a based data.
    ///
    /// - Parameter data: Regular data.
    /// - Returns: Converted data or nil.
    func dataBase(data: Data) -> Data?
}
