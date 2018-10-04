//
//  UICollection.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 08/03/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import UIKit

// MARK: - Extension for UITableView class
public extension UITableView {

    /// Add completion block to default `reloadData` function
    ///
    /// - Parameter completion: the completionBlock
    func reloadData(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.1, animations: { self.reloadData() }) { _ in completion() }
    }
}

// MARK: - Extension for UICollectionView class
public extension UICollectionView {

    /// Add completion block to default `reloadData` function
    ///
    /// - Parameter completion: the completionBlock
    public func reloadData(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.1, animations: { self.reloadData() }) { _ in completion() }
    }
}
