//
//  UITextFieldText.swift
//  KeyrnelTests
//
//  Created by Paul Mougin on 19/02/2018.
//  Copyright © 2018 Nicolas Lourenco. All rights reserved.
//

import XCTest

class UITextFieldText: XCTestCase {

    func testPlaceHolderColor() {
        let textField = UITextField()
        XCTAssertNil(textField.placeHolderColor)
        XCTAssertNil(textField.placeholder)

        textField.placeholder = "Place Holder"
        textField.placeHolderColor = UIColor.red
        XCTAssertEqual(UIColor.red, textField.placeHolderColor)
        XCTAssertEqual("Place Holder", textField.placeholder)
    }
}
