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

    /// Toggle `self` by mutating it

    mutating func toggleInPlace() {

        self = !self
    }

    /// Toggle `self`
    ///
    /// - Returns: A toggled `self`
    
    @warn_unused_result(mutable_variant="toggleInPlace")
    func toggle() -> Bool {

        var value = self
        value.toggleInPlace()

        return value
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