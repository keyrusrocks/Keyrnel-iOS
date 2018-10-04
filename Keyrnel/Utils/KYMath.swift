//
//  KYMath.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 12/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import Foundation

/// Utils for math objects
struct KYMath {

    /// Return degree value to radian
    ///
    /// - Parameter degree: the degree to convert.
    /// - Returns: converted value in radian
    static func toRadians(degree: Double) -> Double {
        return degree * Double.pi / 180.0
    }

    /// Return radian value to degree
    ///
    /// - Parameter radian: the radian to convert.
    /// - Returns: converted value in degree
    static func toDegree(radian: Double) -> Double {
        return radian * (180.0 / Double.pi)
    }
}
