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
    
    /// Check whether `self` is even
    ///
    /// - Returns: True iff `self` is even, false otherwise

    var isEven: Bool {
        return self % 2 == 0
    }

    /// Check whether `self` is odd
    ///
    /// - Returns: True iff `self` is odd, false otherwise

    var isOdd: Bool {
        return !isEven
    }

    /// Check whether `self` is positive
    ///
    /// - Returns: True iff `self` is greater than zero, false otherwise

    var isPositive: Bool {
        return self > 0
    }

    /// Check whether `self` is negative
    ///
    /// - Returns: True iff `self` is less than zero, false otherwise

    var isNegative: Bool {
        return !isNonPositive
    }

    /// Check whether `self` is non-positive
    ///
    /// - Returns: True iff `self` is greater than or equal to zero, false otherwise

    var isNonPositive: Bool {
        return self >= 0
    }

    /// Check whether `self` is non-negative
    ///
    /// - Returns: True iff `self` is less than or equal to zero, false otherwise

    var isNonNegative: Bool {
        return self <= 0
    }

    /// Check whether `self` is non-zero
    ///
    /// - Returns: True iff `self` is not zero, false otherwise

    var isNonZero: Bool {
        return self != 0
    }

    // MARK: - Instance Methods

    /// Repeat a block of code `self` times
    ///
    /// - Parameter closure: The code to be executed `self` times

    func times(@noescape closure: () -> Void) {
        guard self > 0 else {
            return
        }

        for _ in 0..<self {
            closure()
        }
    }

    /// Check whether `self` is divisible by an integer
    ///
    /// - Parameter other: The denominator or divisor
    ///
    /// - Returns: True iff `self` is divisible, false otherwise

    @warn_unused_result
    func isDivisible(by other: Int) -> Bool {
        guard other != 0 else {
            return false
        }

        return self % other == 0
    }

    // MARK: - Type Methods

    /// Generate a uniformly distributed random integer
    ///
    /// - Parameters:
    ///
    ///   - lower: Inclusive lower bound random value
    ///   - upper: Inclusive upper bound random value
    ///
    /// - Returns: A random integer between `lower` and `upper` bounds

    @warn_unused_result
    static func random(from lower: Int, to upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}