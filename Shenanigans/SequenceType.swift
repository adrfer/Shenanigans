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
    /// - Parameter predicate: The predicate called on each element of `self`
    ///
    /// - Returns: A subsequence containing all elements of `self` but those the predicate was false

    @warn_unused_result
    func dropWhile(@noescape predicate: (Self.Generator.Element) throws -> Bool) rethrows -> AnySequence<Self.Generator.Element> {
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
    /// - Parameter predicate: The predicate called on each element of `self`
    ///
    /// - Returns: A new array containing all elements of `self` for which the predicate was true

    @warn_unused_result
    func takeWhile(@noescape predicate: (Self.Generator.Element) throws -> Bool) rethrows -> AnySequence<Self.Generator.Element> {
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
    /// - Parameter predicate: The predicate called on each element of `self`
    ///
    /// - Returns: The first element where `predicate` is `true`, `nil` otherwise

    @warn_unused_result
    func find(@noescape predicate: Self.Generator.Element throws -> Bool) rethrows -> Self.Generator.Element? {
        for element in self where try predicate(element) {
            return element
        }

        return nil
    }

    /// Check if `predicate` is true for at least one element of `self`
    ///
    /// - Parameter predicate: The predicate called on each element of `self`
    ///
    /// - Returns: True iff any element in `self` satisfies `predicate`, false otherwise

    @warn_unused_result
    func any(@noescape predicate: (Self.Generator.Element) throws -> Bool) rethrows -> Bool {
        for element in self where try predicate(element) {
            return true
        }

        return false
    }

    /// Check if `predicate` is true for all elements of `self`
    ///
    /// - Parameter predicate: The predicate called on each element of `self`
    ///
    /// - Returns: True iff every element in `self` satisfies `predicate`, false otherwise

    @warn_unused_result
    func all(@noescape predicate: Self.Generator.Element throws -> Bool) rethrows -> Bool {
        for element in self where try !predicate(element) {
            return false
        }

        return true
    }

    /// Check if `predicate` is false for all elements of `self`
    ///
    /// - Parameter predicate: The predicate called on each element of `self`
    ///
    /// - Returns: True iff every element in `self` does not satisfy `predicate`, false otherwise

    @warn_unused_result
    func none(@noescape predicate: (Self.Generator.Element) throws -> Bool) rethrows -> Bool {
        for element in self where try predicate(element) {
            return false
        }

        return true
    }
}

public extension SequenceType where Self.Generator.Element: Hashable {


    /// Get the frequencies of the elements of `self`
    ///
    /// - Returns: A dictionary where the keys are the elements of `self`, and the values are their frequencies

    @warn_unused_result
    func frequencies() -> [Generator.Element: Int] {
        var dictionary = Dictionary<Generator.Element, Int>()

        for element in self {
            dictionary[element] = dictionary[element]?.successor() ?? 1
        }

        return dictionary
    }

    /// Get the unique elements of `self`
    ///
    /// - Returns: All unique elements of `self`

    @warn_unused_result
    func unique() -> [Self.Generator.Element] {
        var array: Set<Self.Generator.Element> = []

        return filter {
            if array.contains($0) {
                return false
            } else {
                array.insert($0)
                return true
            }
        }
    }
}