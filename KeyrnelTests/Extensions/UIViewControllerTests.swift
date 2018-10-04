//
//  UIViewControllerTests.swift
//  KeyrnelTests
//
//  Created by Nicolas Lourenco on 06/11/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import XCTest
@testable import Keyrnel

class UIViewControllerTests: XCTestCase {

    func testTransitions() {
        let vc = UIViewController()
        let vc2 = UIViewController()
        vc.presentDetail(vc2)
        vc.dismissDetail()
    }
}
