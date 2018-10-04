//
//  UIImageTests.swift
//  KeyrnelTests
//
//  Created by Nicolas Lourenco on 06/11/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import XCTest
@testable import Keyrnel

class UIImageTests: XCTestCase {
    func testImageWithColor() {
        let image = UIImage.imageWithColor(color: UIColor.red, size: CGSize(width: 10.0, height: 10.0))
        XCTAssertNotNil(image)
    }
}
