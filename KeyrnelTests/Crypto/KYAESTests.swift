//
//  KYAESTests.swift
//  KeyrnelTests
//
//  Created by Nicolas Lourenco on 11/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import XCTest
@testable import Keyrnel

class KYAESTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSimpleCyphing() {
        let cypher = KYAES(key: "ABCDEFG123456789", baseConvertor: nil)
        XCTAssertNotNil(cypher)

        let toEncode: String = "hey !"
        let encoded = cypher!.encrypt(string: toEncode) //22QONsPF+MbeswDJwfg+TA==
        XCTAssertNotNil(encoded)

        let decoded = cypher!.decrypt(string: encoded!) //"hey !"
        XCTAssertNotNil(decoded)

        XCTAssertTrue(decoded == toEncode)
    }

    func testIVCyphing() {
        let cypher = KYAES(key: "ABCDEFG123456789", baseConvertor: nil)
        XCTAssertNotNil(cypher)
        cypher?.IV = "XXXXXXXXXXXXXXXX"

        let toEncode: String = "hey !"
        let encoded = cypher!.encrypt(string: toEncode) //pdl9IgAtUbQL+a3C6+9kew==
        XCTAssertNotNil(encoded)

        let decoded = cypher!.decrypt(string: encoded!) //"hey !"
        XCTAssertNotNil(decoded)

        XCTAssertTrue(decoded == toEncode)
    }

    func testCombinedKeyAndConvertor() {
        let convertor = KYBase64()
        let cypher = KYAES(key: "ABCDEFG123456789", baseConvertor: convertor)
        XCTAssertNotNil(cypher)

        cypher?.set(combinedKey: "test")
        let toEncode: String = "hey !"
        let encoded = cypher!.encrypt(string: toEncode) //pdl9IgAtUbQL+a3C6+9kew==
        XCTAssertNotNil(encoded)

        let decoded = cypher!.decrypt(string: encoded!) //"hey !"
        XCTAssertNotNil(decoded)

        XCTAssertTrue(decoded == toEncode)
    }

    func testBadValues() {
        let badConverter = BadConvertor()
        let cypher = KYAES(key: "ABCDEFG123456789", baseConvertor: badConverter)
        XCTAssertNotNil(cypher)

        let string: String! = ""
        let stringValue = cypher?.encrypt(string: string)
        XCTAssertNil(stringValue)

        let otherStringValue = cypher?.decrypt(string: string)
        XCTAssertNil(otherStringValue)

        let data: Data = Data()
        let dataValue = cypher?.encrypt(data: data)
        XCTAssertNil(dataValue)

        let otherDataValue = cypher?.decrypt(data: data)
        XCTAssertNil(otherDataValue)
    }

    func testBadKey() {
        let cypher = KYAES(key: "ABCDEFGHI123456789", baseConvertor: nil)
        XCTAssertNil(cypher)
    }
}
