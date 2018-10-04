//
//  UIToolbarTests.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 03/07/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import XCTest
@testable import Keyrnel

class UIToolbarTests: XCTestCase {

    func testToolbar() {
        let toolbar = UIToolbar().toolbarPiker(buttonTitle: "Next", mySelect: #selector(foo))
        XCTAssertNotNil(toolbar)
    }

    func foo() {
       // 
    }
}
