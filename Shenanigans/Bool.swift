//
//  Bool.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-03.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation

public extension Bool {

    // MARK: - Instance Methods

    /// Toggle a bool value
    ///
    /// - Returns: A toggled bool
    
    @warn_unused_result
    mutating func toggle() -> Bool {
        self = !self
        return self
    }

    // MARK: - Type Methods

    /// Generate a uniformly distributed random bool
    ///
    /// - Returns: A random bool value

    @warn_unused_result
    static func random() -> Bool {
        return [true, false].sample()!
    }
}