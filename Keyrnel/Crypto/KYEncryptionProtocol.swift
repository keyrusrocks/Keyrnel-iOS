//
//  KYEncryptionProtocol.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 06/11/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import UIKit

protocol KYEncryptionProtocol {

    /// Instanciate the cipher with the cryption key.
    ///
    /// - Parameters:
    ///   - key: A cryption key string.
    ///   - baseConvertor: Base convertor (default: Base64). @see KYBaseConverterProtocol
    init?(key: String, baseConvertor: KYBaseConverterProtocol?)

    /// Use a dynamic generated key, combine the current key depending on the given format.
    ///
    /// - Parameter combinedKey: String format for key combine. ex: @"aF3xe%@1"
    ///   Override the current key.
    func set(combinedKey: String?)

    /// Encode a string data.
    ///
    /// - Parameter string: The string to encode.
    /// - Returns: clear string data, nil otherwise.
    func encrypt(string: String) -> String?

    /// Decode a string data.
    ///
    /// - Parameter string: The encoded string.
    /// - Returns: clear string data, nil otherwise.
    func decrypt(string: String) -> String?

    /// Encode a data.
    ///
    /// - Parameter data: The data to encode.
    /// - Returns: encoded data, nil otherwise.
    func encrypt(data: Data) -> Data?

    /// Decode a data.
    ///
    /// - Parameter data: The encoded data.
    /// - Returns: clear data, nil otherwise.
    func decrypt(data: Data) -> Data?
}
