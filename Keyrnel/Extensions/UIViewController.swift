//
//  UIViewController.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 04/08/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import UIKit

public extension UIViewController {

    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)

        present(viewControllerToPresent, animated: false)
    }

    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)

        dismiss(animated: false)
    }
}
