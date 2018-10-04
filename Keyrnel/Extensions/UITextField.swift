//
//  UITextField.swift
//  Keyrnel
//
//  Created by Paul Mougin on 19/02/2018.
//  Copyright © 2018 Nicolas Lourenco. All rights reserved.
//

import UIKit

// MARK: - DesignableTextField class for Xib
@IBDesignable
class DesignableTextField: UITextField {
}

private var phcAssociationKey: UIColor?

public extension UITextField {

    // IBInspectable for placeholder color
    @IBInspectable public var placeHolderColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &phcAssociationKey) as? UIColor
        }
        set {
            objc_setAssociatedObject(self, &phcAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
}
