//
//  KYHTTPCore.swift
//  SwiftyHTTP
//
//  Created by Nicolas Lourenco on 12/12/2016.
//  Copyright © 2016 Nicolas Lourenco. All rights reserved.
//

import UIKit

/*!
 @abstract Failure block.
 */
public typealias HTTPFailBlock = (_ response: HTTPURLResponse?, _ error: Error) -> Void

/*!
 @abstract Success block
 */
public  typealias HTTPSuccessBlock = (_ response: HTTPURLResponse, _ result: Data?) -> Void

// MARK: - Core
public class KYHTTPCore: NSObject {

    // MARK: - Operations
    internal static func send(request: URLRequest, session: URLSession?, success: HTTPSuccessBlock?, failure: HTTPFailBlock?) -> URLSessionDataTask? {
        return KYHTTPCore().send(request: request, session: session, success: success, failure: failure)
    }

    internal func send(request: URLRequest, session: URLSession?, success: HTTPSuccessBlock?, failure: HTTPFailBlock?) -> URLSessionDataTask {

        let _session = session ?? URLSession(configuration: .default)

        return _session.dataTask(with: request, completionHandler: { (data, response, error) in

            if let _error = error {
                print(_error)
                failure?(response as? HTTPURLResponse, _error)

            } else {
                let HTTPResponse = response as! HTTPURLResponse

                if 200 ..< 300 ~= HTTPResponse.statusCode {
                    success?(HTTPResponse, data)
                } else {
                    print(HTTPResponse.statusCode)
                    failure?(HTTPResponse, NSError(domain: "com.keyrus.keyrnel.HTTPCore", code: HTTPResponse.statusCode, userInfo: nil))
                }
            }
        })
    }
}
