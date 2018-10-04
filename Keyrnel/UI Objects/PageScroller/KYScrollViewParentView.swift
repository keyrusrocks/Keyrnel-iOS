//
//  KYScrollViewParentView.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 14/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import UIKit

/// Catch hits in a scroll view.
open class KYScrollViewParentView: UIView {

    /// Scrollview to catch hits on.
    @IBOutlet weak open var scrollView: UIScrollView!

    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)

        if view == self {
            return self.scrollView
        }

        return view
    }
}
