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
}