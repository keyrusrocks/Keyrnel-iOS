//
//  ArrayTests.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 03/07/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import XCTest
@testable import Keyrnel

class ArrayTests: XCTestCase {
    func testRemove() {
        var array = ["ZERTY", "23456", "3456789", "67890"]
        array.remove("ZERTY")

        let expectedResult = ["23456", "3456789", "67890"]
        XCTAssertEqual(expectedResult, array)
    }
}
