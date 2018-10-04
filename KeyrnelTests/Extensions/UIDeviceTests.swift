//
//  UIDeviceTests.swift
//  KeyrnelTests
//
//  Created by Nicolas Lourenco on 12/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import XCTest
@testable import Keyrnel

class UIDeviceTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFunctions() {
        let version = UIDevice.isVersionSuperiorOrEqual(version: "2.0")
        XCTAssertTrue(version)
    }
}
