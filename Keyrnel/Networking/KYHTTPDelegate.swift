//
//  KYHTTPDelegate.swift
//  SwiftyHTTP
//
//  Created by Nicolas Lourenco on 05/12/2016.
//  Copyright © 2016 Nicolas Lourenco. All rights reserved.
//

/*!
 @protocol KYHTTPDelegate
 @abstract Request response protocol.
 */
public protocol KYHTTPDelegate {

    /// Connection has recieved a complete response.
    ///
    /// - Parameter response: Recieved response.
    func catchInfos(response: [String: Any]?)
}
