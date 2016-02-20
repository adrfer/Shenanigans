//
//  CollectionType.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-17.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation

public extension CollectionType where Index.Distance == Int {

    // MARK: - Instance Methods

    /// Choose a random element from `self`
    ///
    /// - parameter size: The size of the sample to be returned from `self`
    ///
    /// - returns: An optional random element from `self` or `nil` if `self` is empty

    @warn_unused_result
    func sample(size size: Int = 1) -> [Generator.Element]? {

        guard !isEmpty else {
            return nil
        }

        var array = Array<Generator.Element>()

        size.times {
            let index = self.startIndex.advancedBy(Int.random(to: size))
            array.append(self[index])
        }

        return array
    }

    /// Shuffle  elements of `self`
    ///
    /// - returns: A copy of `self` with its elements shuffled

    @warn_unused_result
    func shuffle() -> [Generator.Element] {

        var array = Array(self)

        array.shuffleInPlace()
        
        return array
    }
}