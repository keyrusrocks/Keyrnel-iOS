//
//  KYScrollViewPrivateDelegate.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 14/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import UIKit

// Solution from http://stackoverflow.com/questions/9978279/how-to-subclass-uiscrollview-and-make-the-delegate-property-private

/// Handy scroll view private delegate.
open class KYScrollViewPrivateDelegate: NSObject, UIScrollViewDelegate {

    /// User delegate
    open weak var userDelegate: UIScrollViewDelegate?

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        (scrollView as! KYPageScrollView).scrollViewDidScroll()

         self.userDelegate?.scrollViewDidScroll?(scrollView)
    }
}
