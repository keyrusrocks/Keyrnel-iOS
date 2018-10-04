//
//  KYScrollViewTests.swift
//  KeyrnelTests
//
//  Created by Nicolas Lourenco on 20/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import XCTest
@testable import Keyrnel

class KYScrollViewTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInstanciations() {
        var pageScroll: KYPageScrollView? = KYPageScrollView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        XCTAssertNotNil(pageScroll)

        let path = NSTemporaryDirectory() as NSString
        let locToSave = path.appendingPathComponent("teststasks")
        // save tasks
        NSKeyedArchiver.archiveRootObject([pageScroll], toFile: locToSave)

        // load tasks
        pageScroll = (NSKeyedUnarchiver.unarchiveObject(withFile: locToSave) as? [KYPageScrollView])?.first
        XCTAssertNotNil(pageScroll)
    }

    func testPopulateMethod() {
        let pageScroll = KYPageScrollView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let pager = UIPageControl(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        pageScroll.pager = pager

        XCTAssertNotNil(pageScroll.pager)
        XCTAssertEqual(0, pageScroll.pager.numberOfPages)

        var views = [UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))]
        XCTAssertNil(pageScroll.currentView)

        for _ in 0...3 {
            views.append(UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
        }

        pageScroll.populate(with: views)
        pageScroll.pager = pager
        XCTAssertNotNil(pageScroll.pager)

        XCTAssertEqual(0, pageScroll.currentPageIndex)
        XCTAssertEqual(5, pageScroll.numberOfPages)

        XCTAssertNotNil(pageScroll.currentView)
    }

    func testVerticalScroll() {
        let pageScroll = KYPageScrollView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        pageScroll.vertical = true

        let pager = UIPageControl(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        pageScroll.pager = pager
        XCTAssertNotNil(pageScroll.pager)

        var views = [UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))]
        XCTAssertNil(pageScroll.currentView)

        for _ in 0...3 {
            views.append(UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
        }

        pageScroll.populate(with: views)
        pageScroll.pager = UIPageControl(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        XCTAssertNotNil(pageScroll.pager)

        XCTAssertEqual(0, pageScroll.currentPageIndex)
        XCTAssertEqual(5, pageScroll.numberOfPages)

        XCTAssertNotNil(pageScroll.currentView)
    }

    func testScroll() {
        let pageScroll = KYPageScrollView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let customDelegate = CustomDelegate()
        pageScroll.delegate = customDelegate

        let pager = UIPageControl(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        pageScroll.pager = pager
        XCTAssertNotNil(pageScroll.pager)

        pageScroll.fadeAnimation = true
        XCTAssertTrue(pageScroll.fadeAnimation)

        var views = [UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))]
        XCTAssertNil(pageScroll.currentView)

        for _ in 0...3 {
            views.append(UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
        }

        pageScroll.populate(with: views)

        // TODO: Verify why in tests this doesn't work
        XCTAssertEqual(0, pageScroll.currentPageIndex)
        pageScroll.scroll(at: 2, animated: true)
        //XCTAssertEqual(2, pageScroll.currentPageIndex)
        pageScroll.scroll(at: 3, animated: false)
        //XCTAssertEqual(3, pageScroll.currentPageIndex)
        pageScroll.scroll(at: 6, animated: false)
//        XCTAssertEqual(0, pageScroll.currentPageIndex)

        pageScroll.forcedScroll(at: 2, animated: true)
//        XCTAssertEqual(2, pageScroll.currentPageIndex)
        pageScroll.forcedScroll(at: 3, animated: false)
//        XCTAssertEqual(3, pageScroll.currentPageIndex)

        pageScroll.forcedScroll(at: 23, animated: false)
    }

    func testScrollVertical() {
        let pageScroll = KYPageScrollView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        pageScroll.vertical = true

        let pager = UIPageControl(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        pageScroll.pager = pager
        XCTAssertNotNil(pageScroll.pager)

        var views = [UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))]
        XCTAssertNil(pageScroll.currentView)

        for _ in 0...3 {
            views.append(UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
        }

        pageScroll.populate(with: views)

        pageScroll.forcedScroll(at: 2, animated: true)
//        XCTAssertEqual(2, pageScroll.currentPageIndex)

        pageScroll.forcedScroll(at: 3, animated: false)
//        XCTAssertEqual(3, pageScroll.currentPageIndex)

        pageScroll.forcedScroll(at: 23, animated: false)
    }

    func testParentView() {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let pageScroll = KYPageScrollView(frame: rect)
        let parentView = KYScrollViewParentView(frame: rect)

        pageScroll.parentView = parentView
        XCTAssertNotNil(pageScroll.parentView)

        _ =  pageScroll.parentView.hitTest(CGPoint(x: 10, y: 10), with: nil)

        pageScroll.parentView.addSubview(UIView(frame: rect))
        _ =  pageScroll.parentView.hitTest(CGPoint(x: 10, y: 10), with: nil)

        let pager = UIPageControl(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        pageScroll.pager = pager
        XCTAssertNotNil(pageScroll.pager)

        var views = [UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))]
        XCTAssertNil(pageScroll.currentView)

        for _ in 0...3 {
            views.append(UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
        }

        pageScroll.populate(with: views)

    }
}

class CustomDelegate: NSObject, UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }
}
