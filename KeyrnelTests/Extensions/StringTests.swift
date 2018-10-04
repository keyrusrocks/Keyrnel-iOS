//
//  StringTests.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 03/07/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import XCTest
@testable import Keyrnel

class StringTests: XCTestCase {

    struct TestStruct {
        var field: String = ""
    }

    func testClassName() {
        var name = String.className(self)
        XCTAssertNotNil(name)
        XCTAssertEqual(name, "StringTests")

        name = String.className(TestStruct.self)
        XCTAssertNil(name)
    }

    func testCapitalizeFL() {
        var string = "abc"
        string = string.capitalizeFirstLetter

        XCTAssertNotNil(string)
        XCTAssertEqual(string, "Abc")
    }

    func testEmptyToNil() {
        var string: String?
        string = string?.emptyToNil
        XCTAssertNil(string)

        string = ""
        string = string?.emptyToNil
        XCTAssertNil(string)

        string = "AZERTYUIO"
        string = string?.emptyToNil
        XCTAssertNotNil(string)
    }

    func testEmail() {
        var testString: String? = "VKJHG"
        var isValid = String.isValid(mail: testString)
        XCTAssertFalse(isValid)

        testString = "fqfsdf@fsqd"
        isValid = String.isValid(mail: testString)
        XCTAssertFalse(isValid)

        testString = "fqèèf@fsqd"
        isValid = String.isValid(mail: testString)
        XCTAssertFalse(isValid)

        testString = "fqfsdf@fsqd.c"
        isValid = String.isValid(mail: testString)
        XCTAssertTrue(isValid)

        testString = nil
        isValid = String.isValid(mail: testString)
        XCTAssertFalse(isValid)
    }

    func testPassword() {
        var testString = "fqsd"
        var isValid = String.isValid(password: testString)
        XCTAssertFalse(isValid)

        testString = "fqfsdf@fsqd"
        isValid = String.isValid(password: testString)
        XCTAssertTrue(isValid)

        testString = ""
        isValid = String.isValid(password: testString)
        XCTAssertFalse(isValid)
    }
}
