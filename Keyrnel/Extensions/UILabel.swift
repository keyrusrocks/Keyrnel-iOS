//
//  UILabel.swift
//  Keyrnel-Swift
//
//  Created by Nicolas Lourenco on 26/06/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import UIKit

// MARK: - DesignableLabel class for Xib
@IBDesignable
class DesignableLabel: UILabel {
}

private var lblAssociationKey: String?
private var ucAssociationKey: String?
private var lclAssociationKey: String?

// MARK: - Extension for UILabel class
public extension UILabel {

    /// Return the effective number of lines for a label 
    public var lineCount: Int {
        let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.pointSize))

        return rHeight / charSize
    }

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

    // IBInspectable for uppercased the label
    // Only use after setting the text
    @IBInspectable public var uppercased: Bool {
        get {
            return objc_getAssociatedObject(self, &ucAssociationKey) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &ucAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN)

            if newValue == true {
                objc_setAssociatedObject(self, &lblAssociationKey, self.text, .OBJC_ASSOCIATION_RETAIN)
                self.text = self.text?.uppercased()
            } else {
                self.text = objc_getAssociatedObject(self, &lblAssociationKey) as? String
            }
        }
    }
}
