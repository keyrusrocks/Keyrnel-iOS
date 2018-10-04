//
//  KYBase64Tests.swift
//  KeyrnelTests
//
//  Created by Nicolas Lourenco on 12/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import XCTest
@testable import Keyrnel

class KYBase64Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testBaseValues() {
        let convertor = KYBase64()
        XCTAssertNotNil(convertor)

        let data = convertor.data(baseData: Data())
        XCTAssertNotNil(data)

        let string = convertor.stringBase(string: "")
        XCTAssertNotNil(string)

        let badString64 = convertor.string(baseString: "bad value")
        XCTAssertNil(badString64)

        let goodString64 = convertor.string(baseString: "Z29vZCB2YWx1ZQ==")
        XCTAssertEqual("good value", goodString64)

        let goodString = convertor.stringBase(string: "good value")!
        XCTAssertEqual(goodString, "Z29vZCB2YWx1ZQ==")

        var dataCorrupted = "Super test".data(using: .utf8)!.base64EncodedData()
        dataCorrupted.append(contentsOf: [82, 76])

        var dataBase = convertor.dataBase(data: dataCorrupted)!
        dataBase.removeLast()
        let badResponse = convertor.data(baseData: dataBase)
        XCTAssertNil(badResponse)
    }
}
