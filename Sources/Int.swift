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
    /// - Returns: `true` iff `self` is even, `false` otherwise
    
    var isEven: Bool {
        return self % 2 == 0
    }
    
    /// Check whether `self` is odd
    ///
    /// - Returns: `true` iff `self` is odd, `false` otherwise
    
    var isOdd: Bool {
        return !isEven
    }
    
    /// Check whether `self` is positive
    ///
    /// - Returns: `true` iff `self` is greater than zero, `false` otherwise
    
    var isPositive: Bool {
        return self > 0
    }
    
    /// Check whether `self` is negative
    ///
    /// - Returns: `true` iff `self` is less than zero, `false` otherwise
    
    var isNegative: Bool {
        return self < 0
    }
    
    /// Check whether `self` is non-positive
    ///
    /// - Returns: `true` iff `self` is less than or equal to zero, `false` otherwise
    
    var isNonPositive: Bool {
        return self <= 0
    }
    
    /// Check whether `self` is non-negative
    ///
    /// - Returns: `true` iff `self` is greater than or equal to zero, `false` otherwise
    
    var isNonNegative: Bool {
        return self >= 0
    }
    
    /// Check whether `self` is non-zero
    ///
    /// - Returns: `true` iff `self` is not zero, `false` otherwise
    
    var isNonZero: Bool {
        return self != 0
    }
    
    // MARK: - Instance Methods
    
    /// Repeat a block of code `self` times
    ///
    /// - Parameter closure: The code to be executed `self` times
    
    func times(_ closure: () -> Void) {
        
        guard self > 0 else {
            return
        }
        
        for _ in 0 ..< self {
            closure()
        }
    }
    
    /// Repeat a block of code `self` times and pass the current index to the closure
    ///
    /// - Parameter closure: The code to be executed `self` times
    
    func times(_ closure: (Int) -> Void) {
        
        guard self > 0 else {
            return
        }
        
        for index in 0 ..< self {
            closure(index)
        }
    }
    
    /// Repeat a block of code from `self` up to a specific value
    ///
    /// - Parameters:
    ///
    ///   - value: Non-inclusive upper bound value
    ///   - step: The step used to stride over a half-open interval
    ///   - closure: The block of code to be executed
    
    func up(to value: Int, by step: Int = 1, _ closure: () -> Void) {
        
        for _ in Swift.stride(from: self, to: value, by: step) {
            closure()
        }
    }
    
    /// Repeat a block of code from `self` down to a specific value
    ///
    /// - Parameters:
    ///
    ///   - value: Inclusive lower bound value
    ///   - step: The step used to stride over the closed interval
    ///   - closure: The block of code to be executed
    
    func down(to value: Int, by step: Int = -1, _ closure: () -> Void) {
        
        for _ in Swift.stride(from: self, through: value, by: step).reversed() {
            closure()
        }
    }
    
    /// Check whether `self` is divisible by another integer
    ///
    /// - Parameter other: The denominator or divisor
    ///
    /// - Returns:`true` iff `self` is divisible, `false` otherwise
    
    @discardableResult
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
    ///   - lowerBound: Inclusive lower bound value
    ///   - upperBound: Inclusive upper bound value
    ///
    /// - Returns: A random integer between `lowerBound` and `upperBound` values

    @discardableResult
    static func random(from lowerBound: Int, to upperBound: Int) -> Int {
        return lowerBound + Int(arc4random_uniform(UInt32(upperBound - lowerBound + 1)))
    }
}
