//
//  KYAES.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 06/11/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import UIKit
import Security
import CommonCrypto

 /// KYAES
 /// AES cryption data.
 /// This class is in charge of cript an decrypt data.
class KYAES: NSObject, KYEncryptionProtocol {

    /// IV Parameter
    public var IV: String?

    typealias T = KYBaseConverterProtocol
    private var key: String! // Cryptor key
    private var convertor: T!
    private var combinedKey: String?

    private var currentKey: String {
        if let combine = combinedKey {
            return combine
        }

        return self.key
    }

    /// Instanciate the cipher with the cryption key.
    ///
    /// - Parameters:
    ///   - key: A cryption key string.
    ///   - baseConvertor: Base convertor (default: Base64). @see KYBaseConverterProtocol
    required init?(key: String, baseConvertor: KYBaseConverterProtocol?) {
        super.init()

        guard key.count <= kCCKeySizeAES128 else {
            return nil
        }

        self.key = key

        if let convertor = baseConvertor {
            self.convertor = convertor
        } else {
            self.convertor = KYBase64()
        }

        combinedKey = nil
    }

    func set(combinedKey: String?) {
        if let key = combinedKey {
            self.combinedKey = String(format: "%@%@", key, self.key)
        }
    }

    /// Encode a string data.
    ///
    /// - Parameter string: The string to encode.
    /// - Returns: clear string data, nil otherwise.
    func encrypt(string: String) -> String? {
        // Build data.
        let toCryptData: Data = string.data(using: .utf8)!

        // Encrypt data.
        guard let valueData: Data = self.encrypt(data: toCryptData) else { return nil }

        return String(data: valueData, encoding: .utf8)
    }

    /// Decode a string data.
    ///
    /// - Parameter string: The encoded string.
    /// - Returns: clear string data, nil otherwise.
    func decrypt(string: String) -> String? {
        // Build data.
        let cryptedData = string.data(using: .utf8)!

        // Encrypt data.
        guard let valueData: Data = self.decrypt(data: cryptedData) else { return nil }

       return String(data: valueData, encoding: .utf8)
    }

    /// Encode a data.
    ///
    /// - Parameter data: The data to encode.
    /// - Returns: encoded data, nil otherwise.
    func encrypt(data: Data) -> Data? {
        // Encrypte data.
        let valueData: Data = self.encryptAES(data: data, usingKey: self.currentKey)

        // Convert into a base.
        return self.convertor.dataBase(data: valueData)
    }

    /// Decode a data.
    ///
    /// - Parameter data: The encoded data.
    /// - Returns: clear data, nil otherwise.
    func decrypt(data: Data) -> Data? {
        // Convert from base.
        guard let valueData = convertor.data(baseData: data) else { return nil }

        // Decrypt data.
        return self.decryptAES(data: valueData, usingKey: self.currentKey)
    }

    // MARK: Private
    // AES Encryption
    private func encryptAES(data: Data, usingKey key: String) -> Data {
        let keyData: NSData = self.key.data(using: .utf8)! as NSData
        let keyBytes = UnsafeRawPointer(keyData.bytes)

        let dataLength = Int(data.count)
        let dataBytes  = UnsafeRawPointer((data as NSData).bytes)

        let cryptData: NSMutableData! = NSMutableData(length: Int(dataLength) + kCCBlockSizeAES128)
        let cryptPointer = UnsafeMutableRawPointer(cryptData.mutableBytes)
        let cryptLength  = size_t(cryptData.length)

        let keyLength = size_t(kCCKeySizeAES128)
        let operation: CCOperation = UInt32(kCCEncrypt)
        let algoritm: CCAlgorithm = UInt32(kCCAlgorithmAES128)
        let options: CCOptions = UInt32(kCCOptionPKCS7Padding)
        let ivKey: UnsafeRawPointer? = self.IV?.data(using: .utf8)?.withUnsafeBytes({ (ptr) -> UnsafeRawPointer in
            return UnsafeRawPointer(ptr)
        })

        var numBytesEncrypted: size_t = 0

        CCCrypt(operation,
                algoritm,
                options,
                keyBytes,
                keyLength,
                ivKey,
                dataBytes,
                dataLength,
                cryptPointer,
                cryptLength,
                &numBytesEncrypted)

        cryptData.length = Int(numBytesEncrypted)
        return cryptData as Data
    }

    private func decryptAES(data: Data, usingKey key: String) -> Data {
        let keyData: NSData = self.key.data(using: .utf8)! as NSData
        let keyBytes = UnsafeRawPointer(keyData.bytes)

        let dataLength = size_t(data.count)
        let dataBytes =  UnsafeRawPointer((data as NSData).bytes)

        let cryptData: NSMutableData! = NSMutableData(length: Int(dataLength) + kCCBlockSizeAES128)
        let cryptPointer = UnsafeMutableRawPointer(cryptData!.mutableBytes)
        let cryptLength  = size_t(cryptData!.length)

        let keyLength = size_t(kCCKeySizeAES128)
        let operation: CCOperation = UInt32(kCCDecrypt)
        let algoritm: CCAlgorithm = UInt32(kCCAlgorithmAES128)
        let options: CCOptions = UInt32(kCCOptionPKCS7Padding)
        let ivKey: UnsafeRawPointer? = self.IV?.data(using: .utf8)?.withUnsafeBytes({ (ptr) -> UnsafeRawPointer in
            return UnsafeRawPointer(ptr)
        })

        var numBytesEncrypted: size_t = 0

        CCCrypt(operation,
                algoritm,
                options,
                keyBytes,
                keyLength,
                ivKey,
                dataBytes,
                dataLength,
                cryptPointer,
                cryptLength,
                &numBytesEncrypted)

        cryptData.length = Int(numBytesEncrypted)
        return cryptData as Data
    }
}
