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
    /// - Returns: True if even, false otherwise

    var isEven: Bool {
        return self % 2 == 0
    }

    /// Check whether an integer is odd
    ///
    /// - Returns: True if odd, false otherwise

    var isOdd: Bool {
        return !isEven
    }

    /// Check whether an integer is positive
    ///
    /// - Returns: True iff `self` is greater or equal to zero, false otherwise

    var isPositive: Bool {
        return self >= 0
    }

    /// Check whether an integer is negative
    ///
    /// - Returns: True iff `self` is less than zero, false otherwise

    var isNegative: Bool {
        return !isPositive
    }

    // MARK: - Instance Methods

    /// Repeat a block of code `self` times
    ///
    /// - Parameter closure: The code to be executed `self` times

    func times(closure: () -> Void) {
        guard self > 0 else {
            return
        }

        for _ in 0..<self {
            closure()
        }
    }

    /// Check whether an integer is divisible by another
    ///
    /// - Parameter other: The denominator
    ///
    /// - Returns: True iff `self` is divisible, false otherwise

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
    /// - Returns: A random integer between lower and upper bounds

    static func random(from lower: Int, to upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}