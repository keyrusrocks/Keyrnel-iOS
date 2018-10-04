//
//  UILabelTests.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 03/07/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import XCTest
@testable import Keyrnel

class UILabelTests: XCTestCase {

    func testLineCount() {
        let labl = UILabel()
        labl.numberOfLines = 0
        labl.font = UIFont (name: "HelveticaNeue-UltraLight", size: 30)
        labl.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit."

        XCTAssertEqual(1, labl.lineCount)

        labl.frame = CGRect(x: 0, y: 0, width: 100, height: CGFloat(MAXFLOAT))
        XCTAssertEqual(147, labl.lineCount)
    }

    func testTextAllCaps() {
        let labl = UILabel()
        XCTAssertFalse(labl.uppercased)

        labl.text = "Non All Caps Text"
        labl.uppercased = true
        XCTAssertEqual("NON ALL CAPS TEXT", labl.text)

        labl.uppercased = false
        XCTAssertEqual("Non All Caps Text", labl.text)
        XCTAssertFalse(labl.uppercased)
    }

    func testLocalizedKey() {
        let labl = UILabel()
        XCTAssertEqual("", labl.localizedKey)

        labl.localizedKey = "localized_key"
        XCTAssertEqual("localized_key", labl.localizedKey)
    }
}
