//
//  Int.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-01-31.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation

public extension Int {

    // MARK: - Instance Properties
    
    /// Check whether an integer is even
    ///
    /// - returns: True if even, false otherwise

    var isEven: Bool {
        return self % 2 == 0
    }

    /// Check whether an integer is odd
    ///
    /// - returns: True if odd, false otherwise

    var isOdd: Bool {
        return !isEven
    }

    /// Check whether an integer is positive
    ///
    /// - returns: True iff `self` is greater or equal to zero, false otherwise

    var isPositive: Bool {
        return self >= 0
    }

    /// Check whether an integer is negative
    ///
    /// - returns: True iff `self` is less than zero, false otherwise

    var isNegative: Bool {
        return !isPositive
    }

    // MARK: - Type Methods

    /// Generate a uniformly distributed random integer
    ///
    /// - parameters:
    ///
    ///   - lower: Inclusive lower bound random value
    ///   - upper: Inclusive upper bound random value
    ///
    /// - returns: A random integer between lower and upper bounds

    static func random(from lower: Int = 0, to upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}