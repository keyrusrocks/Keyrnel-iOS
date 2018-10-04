//
//  UIButton.swift
//  Keyrnel
//
//  Created by Paul Mougin on 19/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import UIKit

// MARK: - DesignableLabel class for Xib
@IBDesignable
class DesignableButton: UIButton {
}

private var lclAssociationKey: String?

// MARK: - Extenstion for UIButton class
public extension UIButton {

    // IBInspectable for localized string
    @IBInspectable public var localizedKey: String {
        get {
            return objc_getAssociatedObject(self, &lclAssociationKey) as? String ?? ""
        }
        set {
            objc_setAssociatedObject(self, &lclAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            self.setTitle(NSLocalizedString(newValue, comment: ""), for: .normal)
        }
    }
}
