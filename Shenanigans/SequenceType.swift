//
//  SequenceType.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-15.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation

public extension SequenceType {

    // MARK: - Instance Methods

    /// Drop elements of `self` while a predicate is true
    ///
    /// - parameter predicate: The predicate called on each element of `self`
    ///
    /// - returns: A subsequence containing all elements of `self` but those the predicate was false

    @warn_unused_result
    func dropWhile(@noescape predicate: (Generator.Element) throws -> Bool) rethrows -> AnySequence<Generator.Element> {

        var array = Array(self)
        var generator = generate()

        while let element = generator.next() {
            if try !predicate(element) { break }
            array = Array(array.dropFirst())
        }

        return AnySequence(array)
    }

    /// Take elements of `self` while a predicate is true
    ///
    /// - parameter predicate: The predicate called on each element of `self`
    ///
    /// - returns: A new array containing all elements of `self` for which the predicate was true

    @warn_unused_result
    func takeWhile(@noescape predicate: (Generator.Element) throws -> Bool) rethrows -> AnySequence<Generator.Element> {

        var array = ContiguousArray<Generator.Element>()
        var generator = generate()

        while let element = generator.next() {
            if try !predicate(element) { break }
            array.append(element)
        }

        return AnySequence(array)
    }

    /// Find the first element of `self` where `predicate` is true
    ///
    /// - parameter predicate: The predicate called on each element of `self`
    ///
    /// - returns: The first element where `predicate` is `true`, `nil` otherwise

    @warn_unused_result
    func find(@noescape predicate: Generator.Element throws -> Bool) rethrows -> Generator.Element? {
        for element in self where try predicate(element) {
            return element
        }

        return nil
    }

    /// Check if `predicate` is true for all elements of `self`
    ///
    /// - parameter predicate: The predicate called on each element of `self`
    ///
    /// - returns: True iff every element in `self` satisfies `predicate`, false otherwise

    @warn_unused_result
    func all(@noescape predicate: Generator.Element throws -> Bool) rethrows -> Bool {
        for element in self where try !predicate(element) {
            return false
        }

        return true
    }
}