//
//  UIImage.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 28/08/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import UIKit

// MARK: - Extension for UIImage class
public extension UIImage {

    /// Return an image with the giver color and size
    ///
    /// - Parameters:
    ///   - color: The color of the image
    ///   - size: The size of the image
    /// - Returns: The image
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)

        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return image
    }
}
