//
//  UITextView.swift
//  Keyrnel
//
//  Created by Paul Mougin on 21/08/2018.
//  Copyright © 2018 Keyrus. All rights reserved.
//

import UIKit

// MARK: - DesignableLabel class for Xib
@IBDesignable
class DesignableTextView: UITextView {
}

private var lclAssociationKey: String?

// MARK: - Extension for UILabel class
public extension UITextView {

    // IBInspectable for localized string
    @IBInspectable public var localizedKey: String {
        get {
            return objc_getAssociatedObject(self, &lclAssociationKey) as? String ?? ""
        }
        set {
            objc_setAssociatedObject(self, &lclAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            self.text = NSLocalizedString(newValue, comment: "")
        }
    }
}
