//
//  UICollectionTests.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 03/07/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import XCTest
@testable import Keyrnel

class UICollectionTests: XCTestCase {

    func testTableView() {
        let tableView = UITableView()
        tableView.reloadData {

        }
    }

    func testCollectionView() {
        let aFlowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        aFlowLayout.itemSize = CGSize(width: 200, height: 140)
        aFlowLayout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: aFlowLayout)

        collectionView.reloadData {

        }
    }
}
