//
//  Array.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-04.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation

extension Array {

    // MARK: - Instance Properties

    /// Decompose `self` into its head
    ///
    /// - returns: The first element of `self` iff it is not empty, nil otherwise

    var head: Element? {
        return count > 0 ? first! : nil
    }
}