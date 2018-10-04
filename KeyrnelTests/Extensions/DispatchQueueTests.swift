//
//  DispatchQueueTests.swift
//  Keyrnel
//
//  Created by Nicolas Lourenco on 05/07/2017.
//  Copyright © 2017 Keyrus. All rights reserved.
//

import XCTest
@testable import Keyrnel

class DispatchQueueTests: XCTestCase {

    func testMainThread() {
        DispatchQueue.protectedSyncOnMain {
            self.foo()
        }

        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.protectedSyncOnMain {
                self.foo()
            }
        }
    }

    private func foo() {
        //
    }
}
