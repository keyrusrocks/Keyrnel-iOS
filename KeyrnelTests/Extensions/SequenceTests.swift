//
//  SequenceTests.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 03/07/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import XCTest
@testable import Keyrnel

class SequenceTests: XCTestCase {

    func testSequence() {
        var array = [123, 123, 124, 125]
        array = array.unique()

        XCTAssertNotNil(array)
        XCTAssertEqual(array, [123, 124, 125])
    }
}
