//
//  KYMathTests.swift
//  KeyrnelTests
//
//  Created by Nicolas Lourenco on 12/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import XCTest
@testable import Keyrnel

class KYMathTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFunctions() {
        let degree = KYMath.toDegree(radian: 2 * Double.pi)
        XCTAssertEqual(degree, 360)

        let radian = KYMath.toRadians(degree: 360)
        XCTAssertEqual(radian, 2 * Double.pi)
    }
}
