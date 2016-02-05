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
        return count > 0 ? first! : nil
    }

    /// Decompose `self` into its tail
    ///
    /// - returns: A array containing all but the first element of `self` iff it is not empty, nil otherwise

    var tail: [Element]? {
        return count > 0 ? Array(self.dropFirst()) : nil
    }
}