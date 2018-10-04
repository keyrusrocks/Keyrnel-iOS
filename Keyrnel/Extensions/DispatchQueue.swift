//
// DispatchQueue.swift
// Keyrnel
//
// Created by Nicolas Lourenco on 04/07/2017
//
// Copyright © 2017 Keyrus. All rights reserved.
//

import Foundation

// MARK: - Extension for DispatchQueue class
public extension DispatchQueue {
    /// Perfom the given block on main thread
    ///
    /// - Parameter block: The block to execute on main thread
    public static func protectedSyncOnMain(execute block: () -> Swift.Void) {
        if Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.sync {
                block()
            }
        }
    }
}
