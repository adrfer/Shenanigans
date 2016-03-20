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

public extension CollectionType where Index.Distance == Int, Generator.Element: Hashable {

    // MARK: - Instance Methods

    /// Choose a random element from `self`
    ///
    /// - Returns: An optional random element from `self` or `nil` if `self` is empty

    @warn_unused_result
    func sample() -> Generator.Element? {
        guard !isEmpty else {
            return nil
        }

        let offset = Int.random(to: 1)
        let index = self.startIndex.advancedBy(offset)

        return self[index]
    }

    /// Choose random elements from `self`
    ///
    /// - Parameters:
    ///
    ///   - size: The size of the sample to be returned from `self`
    ///   - allowSamePick: The flag that allows chosen elements to be picked again
    ///
    /// - Returns: An optional random element from `self`, or `nil` if `self` is empty

    @warn_unused_result
    func sample(size: Int, allowSamePick: Bool = true) -> [Generator.Element]? {
        guard !isEmpty else {
            return nil
        }

        var size = size
        var array = Array<Generator.Element>()
        var picks: Set<Generator.Element> = Set(self)

        repeat {

            let offset = Int.random(from: 0, to: size)
            let index = self.startIndex.advancedBy(offset)
            let pick = self[index]

            if !allowSamePick && picks.contains(pick) { continue }

            picks.remove(pick)
            array.append(pick)

            size -= 1

        } while size > 0


        return array
    }
}