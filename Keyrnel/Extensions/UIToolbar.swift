//
//  UIToolbar.swift
//  Keyrnel-Swift
//
//  Created by Nicolas Lourenco on 23/06/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import UIKit

// MARK: - Extension for UIToolbar class
public extension UIToolbar {

    /// Create and return an instanciate UIToolbar
    ///
    /// - Parameters:
    ///   - buttonTitle: The button title for the toolbar
    ///   - mySelect: The selector to call
    /// - Returns: The created toolbar
    public func toolbarPiker(buttonTitle: String, mySelect: Selector) -> UIToolbar {
        let toolBar = UIToolbar()

        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: buttonTitle, style: UIBarButtonItemStyle.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)

        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        return toolBar
    }
}
