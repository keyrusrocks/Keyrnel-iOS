//
//  KYPageScrollView.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 14/12/2017.
//  Copyright © 2017 Nicolas Lourenco. All rights reserved.
//

import UIKit

/// Handy paged scroll view.
open class KYPageScrollView: UIScrollView {

    // Scroll orientation.
    open var vertical: Bool! = false

    // Optional fade animation.
    open var fadeAnimation: Bool! = false

    // Optional bind to a page control.
    @IBOutlet weak open var pager: UIPageControl! {
        get {
            return self.internalPager
        }
        set {
            self.internalPager = newValue
            if self.numberOfPages > 0 {
                self.internalPager?.numberOfPages = self.numberOfPages
            }
        }
    }

    // Optional bind to a page view parent.
    @IBOutlet weak open var parentView: KYScrollViewParentView!

    // Current view in scroll view.
    open var currentView: UIView? {
        get {
            if self.subviews.count <= self.currentPageIndex {
                return nil
            }

            return self.subviews[self.currentPageIndex]
        }
    }

    // Current display page index.
    open var currentPageIndex: Int! {
        return _currentPageIndex
    }

    // Number of pages in scroll view.
    open var numberOfPages: Int! {
        return _numberOfPages
    }

    override weak open var delegate: UIScrollViewDelegate? {
        set {
            self.privateDelegate?.userDelegate = newValue
            super.delegate = self.privateDelegate
        }

        get {
            return self.privateDelegate?.userDelegate
        }
    }

    private var privateDelegate: KYScrollViewPrivateDelegate?
    private weak var internalPager: UIPageControl?
    private var _currentPageIndex: Int = 0
    private var _numberOfPages: Int = 0

    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.changeDelegate()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.changeDelegate()
    }

    private func changeDelegate() {
        self.privateDelegate = KYScrollViewPrivateDelegate()
        super.delegate = self.privateDelegate
    }

    /// Create pages for a given list of views.
    ///
    /// - Parameter views: List on UIView.
    open func populate(with views: [UIView]) {
        let scrollViewFrame: CGRect = self.frame
        let containerSize: CGSize = CGSize(width: scrollViewFrame.size.width, height: scrollViewFrame.size.height)

        var firstFrame: CGRect
        var translate: CGAffineTransform

        if self.vertical {
            firstFrame = CGRect(x: 0, y: -containerSize.height, width: containerSize.width, height: containerSize.height)
            translate = CGAffineTransform(translationX: 0, y: containerSize.height)
        } else {
            firstFrame = CGRect(x: -containerSize.width, y: 0, width: containerSize.width, height: containerSize.height)
            translate = CGAffineTransform(translationX: containerSize.width, y: 0)
        }

        var contentViews = [UIView]()
        let containerView = UIView()
        var myView: UIView

        for view in views {
            let viewFrame: CGRect = firstFrame.applying(translate)

            myView = view
            myView.frame = viewFrame

            firstFrame = containerView.frame

            self.addSubview(myView)

            myView.translatesAutoresizingMaskIntoConstraints = false
            contentViews.append(myView)
        }

        // Set the contraints for the scroll view and the inside view.
        let scroll: UIScrollView = self

        var interviewFormat: String = "H:|"
        if self.vertical {
            interviewFormat = "V:|"
        }

        var visualFormat: String = interviewFormat
        var bindings = [String: UIView]()

        for (index, _) in views.enumerated() {
            visualFormat.append(String(format: "[view%i(scroll)]", index))
            bindings[String(format: "view%i", index)] = contentViews[index]
        }

        visualFormat.append("|")
        bindings["scroll"] = scroll

        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormat, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindings))

        var outerviewFormat: String = "V:|"
        if self.vertical {
            outerviewFormat = "H:|"
        }

        for (index, _) in views.enumerated() {
            let format: String = String(format: "%@[view%i(scroll)]|", outerviewFormat, index)
            let _bindings: [String: UIView] = [String(format: "view%i", index): contentViews[index],
                                              "scroll": scroll]
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: _bindings))
        }

        if self.vertical {
            var size: CGFloat = 0
            for view in contentViews {
                size += view.frame.size.height
            }

            let firstView: UIView = contentViews[0]
            self.contentSize = CGSize(width: firstView.frame.size.width, height: size)
        } else {
            var size: CGFloat = 0
            for view in contentViews {
                size += view.frame.size.width
            }

            let firstView = contentViews[0]
            self.contentSize = CGSize(width: size, height: firstView.frame.size.height)
        }

        self._numberOfPages = views.count

        if let _pager = self.internalPager {
            _pager.numberOfPages = self.numberOfPages
            _pager.hidesForSinglePage = true
        }
    }

    /// Scroll to page a index.
    ///
    /// - Parameters:
    ///   - index: Index to scroll to.
    ///   - animated: Animation option.
    open func scroll(at index: UInt, animated: Bool) {
        for (i, view) in self.subviews.enumerated() {
            if i == index {
                self.setContentOffset(view.frame.origin, animated: animated)
                break
            }
        }
    }

    /// Scroll to page a index.
    ///
    /// - Parameters:
    ///   - index: Index to scroll to.
    ///   - animated: Animation option.
    open func forcedScroll(at index: UInt, animated: Bool) {
        var _index = index

        if self.subviews.count > 0 {
            while _index >= self.numberOfPages {
                _index -= 1
            }

            let point: CGPoint = self.vertical ? CGPoint(x: 0, y: CGFloat(_index) * self.subviews[0].frame.size.height) : CGPoint(x: CGFloat(_index) * self.subviews[0].frame.size.width, y: 0)
            self.setContentOffset(point, animated: animated)
        }
    }

    // For private use only.
    public func scrollViewDidScroll() {

        let viewWidth: CGFloat = self.frame.size.width
        let position: CGFloat = self.contentOffset.x + (viewWidth / 2)

        let value = Int(position / viewWidth)
        self._currentPageIndex = max(0, min(self.subviews.count - 1, value))

        if let _pager = self.internalPager {
            _pager.currentPage = self.currentPageIndex
        }

        if self.fadeAnimation {
            let diffFromCenter: CGFloat = abs(self.contentOffset.x - (CGFloat(self.currentPageIndex) * self.frame.size.width))
            let currentPageAlpha: CGFloat = 1.0 - 3 * diffFromCenter / self.frame.size.width
            let sidePagesAlpha: CGFloat = 0.0

            self.subviews[self.currentPageIndex].alpha = currentPageAlpha

            if self.currentPageIndex > 0 {
                self.subviews[self.currentPageIndex - 1].alpha = sidePagesAlpha
            }

            if self.currentPageIndex < self.subviews.count - 1 {
                self.subviews[self.currentPageIndex + 1].alpha = sidePagesAlpha
            }
        }
    }
}
