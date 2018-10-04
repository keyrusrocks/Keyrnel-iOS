//
//  UITextViewTests.swift
//  KeyrnelTests
//
//  Created by Paul Mougin on 21/08/2018.
//  Copyright © 2018 Keyrus. All rights reserved.
//

import XCTest
@testable import Keyrnel

class UITextViewTests: XCTestCase {

    func testLocalizedKey() {
        let textView = UITextView()
        XCTAssertEqual("", textView.localizedKey)

        textView.localizedKey = "localized_key"
        XCTAssertEqual("localized_key", textView.localizedKey)
    }
}
