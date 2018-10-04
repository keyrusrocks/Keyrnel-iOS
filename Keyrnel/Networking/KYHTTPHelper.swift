//
//  KYHTTPHelper.swift
//  SwiftyHTTP
//
//  Created by Nicolas Lourenco on 05/12/2016.
//  Copyright © 2016 Nicolas Lourenco. All rights reserved.
//

import UIKit

/*!
 @class KYSimpleHTTPRequest
 @abstract Simple KYHTTP connection helper.
 */
public class KYHTTPHelper: NSObject {

    // MARK: - Public functions
    /// Simple request sender.
    ///
    /// - Parameters:
    ///   - request: request to perform.
    ///   - session: to use custom session.
    ///   - delegate: specific delegate.
    ///   - onSuccess: Success completion block.
    ///   - onFailure: Failure completion block.
    /// - Returns: URLSessionDataTask
    public static func sendRequest(request: URLRequest, session: URLSession?, delegate: KYHTTPDelegate?, onSuccess: HTTPSuccessBlock?, onFailure: HTTPFailBlock?) -> URLSessionDataTask? {

        return KYHTTPCore.send(request: request, session: session, success: onSuccess, failure: onFailure)
    }

    /// Simple GET request with additional headers.
    ///
    /// - Parameters:
    ///   - url: URL to call.
    ///   - session: to use custom session.
    ///   - headers: Additional headers.
    ///   - onSuccess: Success completion block.
    ///   - onFailure: Failure completion block.
    /// - Returns: URLSessionDataTask
    public static func get(url: String, session: URLSession?, headers: Dictionary<String, String>?, onSuccess: HTTPSuccessBlock?, onFailure: HTTPFailBlock?) -> URLSessionDataTask? {

        guard let _url = URL(string: url) else {
            print("url is not convertible to URL()")
            return nil
        }

        let request: KYURLRequest = KYURLRequest(url: _url)
        request.method = .get
        request.headers = headers

        return KYHTTPCore.send(request: request.format(), session: session, success: onSuccess, failure: onFailure)
    }

    /// Simple POST request with additional headers
    ///
    /// - Parameters:
    ///   - url: URL to call.
    ///   - body: Content body.
    ///   - session: to use custom session.
    ///   - headers: Additional headers.
    ///   - onSuccess: Success completion block.
    ///   - onFailure: Failure completion block.
    /// - Returns: URLSessionDataTask
    public static func post(url: String, body: String?, session: URLSession?, headers: Dictionary<String, String>?, onSuccess: HTTPSuccessBlock?, onFailure: HTTPFailBlock?) -> URLSessionDataTask? {

        guard let _url = URL(string: url) else {
            print("url is not convertible to URL()")
            return nil
        }

        let request: KYURLRequest = KYURLRequest(url: _url)
        request.method = .post
        request.body = body
        request.headers = headers

        return KYHTTPCore.send(request: request.format(), session: session, success: onSuccess, failure: onFailure)
    }

    /// Simple PUT request with additional headers.
    ///
    /// - Parameters:
    ///   - url: URL to call.
    ///   - body: Content body.
    ///   - session: to use custom session.
    ///   - headers: Additional headers.
    ///   - onSuccess: Success completion block.
    ///   - onFailure: Failure completion block.
    /// - Returns: URLSessionDataTask
    public static func put(url: String, body: String?, session: URLSession?, headers: Dictionary<String, String>?, onSuccess: HTTPSuccessBlock?, onFailure: HTTPFailBlock?) -> URLSessionDataTask? {

        guard let _url = URL(string: url) else {
            print("url is not convertible to URL()")
            return nil
        }

        let request: KYURLRequest = KYURLRequest(url: _url)
        request.method = .put
        request.body = body
        request.headers = headers
        request.url = _url

        return KYHTTPCore.send(request: request.format(), session: session, success: onSuccess, failure: onFailure)
    }

    /// Simple PUT request with additional headers.
    ///
    /// - Parameters:
    ///   - url: URL to call.
    ///   - session: to use custom session.
    ///   - headers: Additional headers.
    ///   - onSuccess: Success completion block.
    ///   - onFailure: Failure completion block.
    /// - Returns: URLSessionDataTask
    public static func delete(url: String, session: URLSession?, headers: Dictionary<String, String>?, onSuccess: HTTPSuccessBlock?, onFailure: HTTPFailBlock?) -> URLSessionDataTask? {

        guard let _url = URL(string: url) else {
            print("url is not convertible to URL()")
            return nil
        }

        let request: KYURLRequest = KYURLRequest(url: _url)

        request.method = .delete
        request.headers = headers

        return KYHTTPCore.send(request: request.format(), session: session, success: onSuccess, failure: onFailure)
    }

    /// Simple HEAD request with additional headers.
    ///
    /// - Parameters:
    ///   - url: URL to call.
    ///   - session: to use custom session.
    ///   - headers: Additional headers.
    ///   - onSuccess: Success completion block.
    ///   - onFailure: Failure completion block.
    /// - Returns: URLSessionDataTask
    public static func head(url: String, session: URLSession?, headers: Dictionary<String, String>?, onSuccess: HTTPSuccessBlock?, onFailure: HTTPFailBlock?) -> URLSessionDataTask? {

        guard let _url = URL(string: url) else {
            print("url is not convertible to URL()")
            return nil
        }

        let request: KYURLRequest = KYURLRequest(url: _url)
        request.method = .head
        request.headers = headers

        return KYHTTPCore.send(request: request.format(), session: session, success: onSuccess, failure: onFailure)
    }

    /// Simple PATCH request with additional headers.
    ///
    /// - Parameters:
    ///   - url: URL to call.
    ///   - body: Content body.
    ///   - session: to use custom session.
    ///   - headers: Additional headers.
    ///   - onSuccess: Success completion block.
    ///   - onFailure: Failure completion block.
    /// - Returns: URLSessionDataTask
    public static func patch(url: String, body: String?, session: URLSession?, headers: Dictionary<String, String>?, onSuccess: HTTPSuccessBlock?, onFailure: HTTPFailBlock?) -> URLSessionDataTask? {

        guard let _url = URL(string: url) else {
            print("url is not convertible to URL()")
            return nil
        }

        let request: KYURLRequest = KYURLRequest(url: _url)
        request.method = .patch
        request.body = body
        request.headers = headers

        return KYHTTPCore.send(request: request.format(), session: session, success: onSuccess, failure: onFailure)
    }
}
