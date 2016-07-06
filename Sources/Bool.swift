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

    mutating func toggle() {

        self = !self
    }

    /// Toggle `self`
    ///
    /// - Returns: A toggled `self`
    
    @discardableResult
    func toggled() -> Bool {

        var value = self
        value.toggle()

        return value
    }

    // MARK: - Type Methods

    /// Generate a uniformly distributed random bool
    ///
    /// - Returns: A random bool value

    @discardableResult
    static func random() -> Bool {

        return [true, false].sampled()!
    }
}
