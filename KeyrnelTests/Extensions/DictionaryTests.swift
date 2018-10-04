//
//  DictionaryTests.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 03/07/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import XCTest
@testable import Keyrnel

class DictionaryTests: XCTestCase {

    func testPlusOperator() {
        var left: [String: Any] = ["firstKey": "firstValue"]
        let right: [String: Any] = ["secondKey": "secondValue"]

        var result = left + right
        XCTAssertNotNil(result)

        var expectedResult: [String: Any] = ["firstKey": "firstValue",
                              "secondKey": "secondValue"]
        XCTAssertEqual(expectedResult as NSObject, result as NSObject)

        left = ["": 123]
        result = left + right
        expectedResult = ["": 123,
                          "secondKey": "secondValue"]
        XCTAssertEqual(expectedResult as NSObject, result as NSObject)
    }

    func testPlusInoutOperator() {
        var left: [String: Any] = ["firstKey": "firstValue"]
        let right: [String: Any] = ["secondKey": "secondValue"]

        left += right
        XCTAssertNotNil(left)

        var expectedResult: [String: Any] = ["firstKey": "firstValue",
                                             "secondKey": "secondValue"]
        XCTAssertEqual(expectedResult as NSObject, left as NSObject)

        left = ["": 123]
        left += right
        expectedResult = ["": 123,
                          "secondKey": "secondValue"]
        XCTAssertEqual(expectedResult as NSObject, left as NSObject)
    }
}
