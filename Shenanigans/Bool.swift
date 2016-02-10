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
    /// - returns: A toggled bool
    
    mutating func toggle() -> Bool {
        self = !self
        return self
    }

    // MARK: - Type Methods

    /// Generate a uniformly distributed random bool
    ///
    /// - returns: A random bool value

    static func random() -> Bool {
        return [true, false][Int.random(from: 0, to: 1)]
        // return [true, false].sample()
    }
}