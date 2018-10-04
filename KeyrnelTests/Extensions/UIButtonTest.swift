//
//  UIButtonTest.swift
//  KeyrnelTests
//
//  Created by Paul Mougin on 19/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import XCTest
@testable import Keyrnel

class UIButtonTest: XCTestCase {

    func testLocalizedKey() {
        let button = UIButton()
        XCTAssertEqual("", button.localizedKey)

        button.localizedKey = "localized_key"
        XCTAssertEqual("localized_key", button.localizedKey)
    }
}
