//
//  KYURLRequest.swift
//  SwiftyHTTP
//
//  Created by Nicolas Lourenco on 09/12/2016.
//  Copyright © 2016 Nicolas Lourenco. All rights reserved.
//

import UIKit

public enum Method: String {
    case get = "GET"
    case delete = "DELETE"
    case head = "HEAD"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}

public class KYURLRequest: NSMutableURLRequest {

    var method: Method? {
        didSet {
            if let m = method?.rawValue {
                self.httpMethod = m
            }
        }
    }

    public var path: String?
    public var parameters: [String: String]?
    public var body: String?
    public var headers: [String: String]?

    func format() -> URLRequest {
        //Protected by the URLRequest init
        var URL: URL = self.url!

        if let _path = path {
            URL = URL.appendingPathComponent(_path)
        }

        // We can't fail because URL is already tested
        let components = NSURLComponents(url: URL, resolvingAgainstBaseURL: false)!
        components.queryItems = parameters?.map {
            URLQueryItem(name: String($0), value: String($1))
        }

        self.url = components.url
        self.allHTTPHeaderFields = headers

        if let body = body {
            self.httpBody = body.data(using: .utf8)!
            self.addValue("\(String(describing: body.count))", forHTTPHeaderField: "Content-Length")
        }

        return self as URLRequest
    }
}
