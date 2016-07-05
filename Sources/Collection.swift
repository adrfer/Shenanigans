//
//  CollectionType.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-17.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation

public extension Collection {

    // MARK: - Instance Methods

    /// Shuffle elements of `self`
    ///
    /// - Returns: A copy of `self` with its elements shuffled

    @warn_unused_result(mutable_variant:"shuffle")
    func shuffled() -> [Iterator.Element] {

        var array = Array(self)
        array.shuffle()

        return array
    }
}

public extension Collection where IndexDistance == Int {

    // MARK: - Instance Methods

    /// Choose a random element from `self`
    ///
    /// - Returns: An optional random element from `self`, or `nil` if `self` is empty

    @warn_unused_result
    func sampled() -> Iterator.Element? {

        guard !isEmpty else {
            return nil
        }

        let offset = Int.random(from: 0, to: count - 1)

        return self[index(startIndex, offsetBy: offset)]
    }
}

public extension Collection where Index: Comparable {

    // MARK: - Subscripts

    /// Slice a collection by first clamping the range to its bounds
    ///
    /// - Parameter range: The range of values used to slice the collection
    ///
    /// - Returns: A bounded subsequence
    ///
    /// - Note: This behaviour avoids throwing a fatal error in execution time

    subscript(clamping range: Range<Index>) -> SubSequence {

        let startIndex = Swift.max(self.startIndex, range.lowerBound)
        let endIndex = Swift.min(self.endIndex, range.upperBound)

        return self[startIndex ..< endIndex]
    }

    /// Slice a collection by first checking if a range is out of bounds
    ///
    /// - Parameter range: The range of values used to slice the collection
    ///
    /// - Returns: A bounded subsequence, or `nil` when the range is out of bounds
    ///
    /// - Note: This behaviour avoids throwing a fatal error in execution time

    subscript(checking range: Range<Index>) -> SubSequence? {

        guard range.lowerBound >= startIndex && range.upperBound <= endIndex else {
            return nil
        }

        return self[range]
    }

    /// Slice a collection by first checking if index is out of bounds
    ///
    /// - Parameter index: The index used to slice the collection
    ///
    /// - Returns: An element of the collection, or `nil` iff it is out of bounds
    ///
    /// - Note: This behaviour avoids throwing a fatal error in execution time

    subscript(checking index: Index) -> Iterator.Element? {

        guard index >= startIndex && index < endIndex else {
            return nil
        }

        return self[index]
    }
}
