//
//  UIView.swift
//  Keyrnel-Swift
//
//  Created by Nicolas Lourenco on 23/06/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import UIKit

// MARK: - DesignableView class for Xib
@IBDesignable
class DesignableView: UIView {
}

private var xoAssociationKey: Double = 0.0

// MARK: - Extension for UIView class
public extension UIView {

    /// IBInspectable for corner radius
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    /// IBInspectable for border width
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    /// IBInspectable for border color
    @IBInspectable public var borderColor: UIColor {
        get {
            /* The color of the layer's border. Defaults to opaque black. Colors
             * created from tiled patterns are supported. Animatable. */
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }

    /// IBInspectable for shadow offset
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    /// IBInspectable for shadow radius
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    /// IBInspectable for shadow opacity
    @IBInspectable public var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    /// IBInspectable for shadow color
    @IBInspectable public var shadowColor: UIColor {
        get {
            /* The color of the shadow. Defaults to opaque black. Colors created
             * from patterns are currently NOT supported. Animatable. */
            return UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }

    @IBInspectable public var elevatation: Double {
        get {
            return objc_getAssociatedObject(self, &xoAssociationKey) as! Double
        } set (newValue) {
            objc_setAssociatedObject(self, &xoAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)

            self.layer.masksToBounds = false
            self.layer.shadowOffset = CGSize(width: 0, height: newValue)
            self.layer.shadowRadius = CGFloat(newValue)
            self.layer.shadowOpacity = 0.24
        }
    }

    func pauseAnimations() {
        let pausedTime = self.layer.convertTime(CACurrentMediaTime(), from: nil)
        self.layer.speed = 0.0
        self.layer.timeOffset = pausedTime
    }

    func resumeAnimations() {
        let pausedTime = self.layer.timeOffset
        self.layer.speed = 1.0
        self.layer.timeOffset = 0.0
        self.layer.beginTime = 0.0

        let timeSincePause = self.layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        self.layer.beginTime = timeSincePause
    }
}
