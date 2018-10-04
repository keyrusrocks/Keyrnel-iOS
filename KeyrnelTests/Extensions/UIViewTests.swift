//
//  UIViewTests.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 03/07/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import XCTest
@testable import Keyrnel

class UIViewTests: XCTestCase {

    func testInspectable() {
        let view = UIView()
        XCTAssertNotNil(view)

        XCTAssertEqual(0.0, view.cornerRadius)
        view.cornerRadius = 10.0
        XCTAssertEqual(10.0, view.cornerRadius)

        XCTAssertEqual(0.0, view.borderWidth)
        view.borderWidth = 2.0
        XCTAssertEqual(2.0, view.borderWidth)

        view.borderColor = UIColor.red
        XCTAssertEqual(UIColor.red, view.borderColor)

        XCTAssertEqual(CGSize(width: 0.0, height: -3.0), view.shadowOffset)
        view.shadowOffset = CGSize(width: 3.0, height: 3.0)
        XCTAssertEqual(CGSize(width: 3.0, height: 3.0), view.shadowOffset)

        XCTAssertEqual(3.0, view.shadowRadius)
        view.shadowRadius = 5.0
        XCTAssertEqual(5.0, view.shadowRadius)

        XCTAssertEqual(0.0, view.shadowOpacity)
        view.shadowOpacity = 10.0
        XCTAssertEqual(10.0, view.shadowOpacity)

        view.elevatation = 0.0
        XCTAssertEqual(0.0, view.elevatation)

        view.shadowColor = UIColor.blue
        XCTAssertEqual(UIColor.blue, view.shadowColor)

        view.elevatation = 2.0
        XCTAssertEqual(2.0, view.elevatation)

        view.pauseAnimations()
        view.resumeAnimations()
    }
}
