//
//  KYUserDefaultsTests.swift
//  KeyrnelTests
//
//  Created by Nicolas Lourenco on 12/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import XCTest
import MapKit
@testable import Keyrnel

class KYUserDefaultsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFunctions() {
        var convertor: KYBaseConverterProtocol = BadConvertor()
        var defaults = KYUserDefaults(cryptor: KYAES(key: "ABCDEFG123456789", baseConvertor: convertor))
        XCTAssertNotNil(defaults)

        let key = "StringKey"

        defaults.set(value: "", forKey: key)
        var stringValue = defaults.object(forKey: key)
        XCTAssertNil(stringValue)

        convertor = KYBase64()
        defaults = KYUserDefaults(cryptor: KYAES(key: "ABCDEFG123456789", baseConvertor: convertor))

        defaults.set(value: "String", forKey: "StringKey")
        stringValue = defaults.object(forKey: key)
        XCTAssertEqual("String", stringValue as! String)

        defaults.set(value: "Blablabla", forKey: key)
        stringValue = defaults.object(forKey: key)
        XCTAssertEqual(stringValue as! String, "Blablabla")

        defaults.removeObject(forKey: key)
        let badValue: Any? = defaults.object(forKey: key)
        XCTAssertNil(badValue)
    }

    func testCustomObjects() {
        let convertor: KYBaseConverterProtocol = KYBase64()
        let defaults = KYUserDefaults(cryptor: KYAES(key: "ABCDEFG123456789", baseConvertor: convertor))
        XCTAssertNotNil(defaults)

        let key = "FakeCustomObject"
        let objectType: String = "Fake custom object"
        let stat = defaults.save(customObject: objectType, forKey: key)
        XCTAssertTrue(stat)

        let object = defaults.load(key: key) as! String
        XCTAssertEqual(object, objectType)

        let fakeObject = defaults.load(key: "fakeObject")
        XCTAssertNil(fakeObject)

        let coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let status = defaults.save(customObject: coordinate, forKey: "coordinate")
        XCTAssertFalse(status)
    }
}
