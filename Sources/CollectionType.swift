//
//  CollectionType.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-17.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation

public extension CollectionType {

    // MARK: - Instance Methods

    /// Shuffle elements of `self`
    ///
    /// - Returns: A copy of `self` with its elements shuffled

    @warn_unused_result(mutable_variant="shuffleInPlace")
    func shuffle() -> [Generator.Element] {
        var array = Array(self)
        array.shuffleInPlace()
        return array
    }
}

public extension CollectionType where Index.Distance == Int {

    // MARK: - Instance Methods

    /// Choose a random element from `self`
    ///
    /// - Returns: An optional random element from `self`, or `nil` if `self` is empty

    @warn_unused_result
    func sample() -> Generator.Element? {
        guard !isEmpty else {
            return nil
        }

        let offset = Int.random(from: 0, to: count - 1)
        let index = startIndex.advancedBy(offset)

        return self[index]
    }
}

public extension CollectionType where Index: Comparable {

    // MARK: - Subscripts

    /// Slice a collection by first clamping the range to its bounds
    ///
    /// - Parameter range: The range of values used to slice the collection
    ///
    /// - Returns: A bounded subsequence
    ///
    /// - Note: This behaviour avoids throwing a fatal error in execution time

    subscript(clamping range: Range<Index>) -> SubSequence {
        let startIndex = max(self.startIndex, range.startIndex)
        let endIndex = min(self.endIndex, range.endIndex)

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
        guard range.startIndex >= startIndex && range.endIndex <= endIndex else {
            return nil
        }

        return self[range]
    }
}