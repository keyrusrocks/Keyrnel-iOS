//
//  UIDevice.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 12/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import UIKit

public extension UIDevice {

    /// Compare the given version with the system version.
    ///
    /// - Parameter version: The version to compare
    static func isVersionSuperiorOrEqual(version: String) -> Bool {
        // Compare each numbers.
        return UIDevice.current.systemVersion.compare(version) != .orderedDescending
    }
}
