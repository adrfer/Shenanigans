//
//  Array.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-04.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation

public extension Array {

    // MARK: - Instance Properties

    /// Decompose `self` into its head
    ///
    /// - returns: The first element of `self` iff it is not empty, nil otherwise

    var head: Element? {
        return isEmpty ? nil : first
    }

    /// Decompose `self` into its tail
    ///
    /// - returns: A array containing all but the first element of `self` iff it is not empty, nil otherwise

    var tail: [Element]? {
        return isEmpty ? nil : Array(self[1..<count])
    }

    // MARK: - Instance Methods

    /// Decompose `self` into its head and tail
    ///
    /// - returns: A tuple containing the head and tail of `self`

    @warn_unused_result
    func decompose() -> (Element?, [Element]?) {
        return (head, tail)
    }
}