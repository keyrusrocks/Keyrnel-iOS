//
//  KYHTTPTests.swift
//  KeyrnelTests
//
//  Created by Nicolas Lourenco on 13/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import XCTest
@testable import Keyrnel

class KYHTTPTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testWrongURL() {
        var task = KYHTTPHelper.get(url: "", session: nil, headers: nil, onSuccess: nil, onFailure: nil)
        XCTAssertNil(task)

        task = KYHTTPHelper.post(url: "", body: nil, session: nil, headers: nil, onSuccess: nil, onFailure: nil)
        XCTAssertNil(task)

        task = KYHTTPHelper.put(url: "", body: nil, session: nil, headers: nil, onSuccess: nil, onFailure: nil)
        XCTAssertNil(task)

        task = KYHTTPHelper.delete(url: "", session: nil, headers: nil, onSuccess: nil, onFailure: nil)
        XCTAssertNil(task)

        task = KYHTTPHelper.head(url: "", session: nil, headers: nil, onSuccess: nil, onFailure: nil)
        XCTAssertNil(task)

        task = KYHTTPHelper.patch(url: "", body: nil, session: nil, headers: nil, onSuccess: nil, onFailure: nil)
        XCTAssertNil(task)
    }

    func testBadRequest() {
        let getExpec = expectation(description: "getBadRequest")
        KYHTTPHelper.get(url: "https://google.fro", session: nil, headers: nil, onSuccess: { (_, _) in
            XCTFail("Expected getBadRequest to fail, but it succeed. ?")
        }) { (_, error) in
            XCTAssertEqual(-1003, (error as NSError).code)
            getExpec.fulfill()
            }?.resume()

        waitForExpectations(timeout: 10, handler: nil)
    }

    func testHTTPError() {
        let getExpec = expectation(description: "getBadRequest")
        KYHTTPHelper.get(url: "https://google.fr/fsfsd", session: nil, headers: nil, onSuccess: { (_, _) in
            XCTFail("Expected getBadRequest to fail, but it succeed. ?")
        }) { (_, error) in
            XCTAssertEqual(404, (error as NSError).code)
            getExpec.fulfill()
            }?.resume()

        waitForExpectations(timeout: 10, handler: nil)
    }

    func testURLRequest() {
        let sendReqExpec = expectation(description: "sendReqExpec")

        let request: KYURLRequest = KYURLRequest(url: URL(string: "https://google.fr")!)
        request.path = "search"
        request.parameters = ["q": "XCTest",
                              "oq": "XCTest",
                              "source": "hp"]
        request.body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

        request.method = .post
        KYHTTPCore.send(request: request.format(), session: nil, success: { (_, _) in
            XCTFail("Expected bad response, but it succeed. ?")
        }) { (_, _) in
            sendReqExpec.fulfill()
            }?.resume()

        waitForExpectations(timeout: 10, handler: nil)
    }

    func testSendRequest() {
        let sendReqExpec = expectation(description: "sendReqExpec")

        var request = URLRequest(url: URL(string: "https://google.fr")!)
        request.httpMethod = "GET"

        KYHTTPHelper.sendRequest(request: request, session: nil, delegate: nil, onSuccess: { (_, _) in
            sendReqExpec.fulfill()
        }) { (_, error) in
            XCTFail(error.localizedDescription)
            }?.resume()

        waitForExpectations(timeout: 10, handler: nil)
    }

    func testGetRequest() {
        let getExpec = expectation(description: "getGoodRequest")
        KYHTTPHelper.get(url: "https://google.fr", session: nil, headers: nil, onSuccess: { (response, _) in
            XCTAssertEqual(200, response.statusCode)
            getExpec.fulfill()
        }) { (_, error) in
            XCTFail(error.localizedDescription)
            }?.resume()

        waitForExpectations(timeout: 10, handler: nil)
    }

    func testPostRequest() {
        let sendReqExpec = expectation(description: "sendReqExpec")

        KYHTTPHelper.post(url: "https://google.fr", body: "empty", session: nil, headers: nil, onSuccess: { (_, _) in
            sendReqExpec.fulfill()
        }) { (_, _) in
            sendReqExpec.fulfill()
            }?.resume()

        waitForExpectations(timeout: 10, handler: nil)
    }

    func testPutRequest() {
        let sendReqExpec = expectation(description: "testPutRequest")

        KYHTTPHelper.put(url: "https://google.fr", body: nil, session: nil, headers: nil, onSuccess: { (_, _) in
            sendReqExpec.fulfill()
        }) { (_, _) in
            sendReqExpec.fulfill()
            }?.resume()

        waitForExpectations(timeout: 10, handler: nil)
    }

    func testDeleteRequest() {
        let sendReqExpec = expectation(description: "testDeleteRequest")

        KYHTTPHelper.delete(url: "https://google.fr", session: nil, headers: nil, onSuccess: { (_, _) in
            sendReqExpec.fulfill()
        }) { (_, _) in
            sendReqExpec.fulfill()
            }?.resume()

        waitForExpectations(timeout: 10, handler: nil)
    }

    func testHeadRequest() {
        let sendReqExpec = expectation(description: "testHeadRequest")

        KYHTTPHelper.head(url: "https://google.fr", session: nil, headers: nil, onSuccess: { (_, _) in
            sendReqExpec.fulfill()
        }) { (_, _) in
            sendReqExpec.fulfill()
            }?.resume()

        waitForExpectations(timeout: 10, handler: nil)
    }

    func testPatchRequest() {
        let sendReqExpec = expectation(description: "testPatchRequest")

        KYHTTPHelper.patch(url: "https://google.fr", body: nil, session: nil, headers: nil, onSuccess: { (_, _) in
            sendReqExpec.fulfill()
        }) { (_, _) in
            sendReqExpec.fulfill()
            }?.resume()

        waitForExpectations(timeout: 10, handler: nil)
    }
}
