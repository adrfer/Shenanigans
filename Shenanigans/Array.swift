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

    /// Shuffle the elements of `self`
    ///
    /// - returns: A copy of `self` with its elements shuffled

    @warn_unused_result
    func shuffle() -> [Element] {

        guard count > 1 else {
            return self
        }

        var array = Array(self)

        for i in 0..<array.count - 1 {

            let j = Int.random(from: i, to: array.count - 1)
            
            if i != j { swap(&array[i], &array[j]) }
        }
        
        return array
    }

    /// Check if a predicate is true for at least one element of `self`
    ///
    /// - parameter predicate: The predicate called on each element of `self`
    ///
    /// - returns: True iff the predicate returns true for any element, false otherwise

    @warn_unused_result
    func any(@noescape predicate: (Element) throws -> Bool) rethrows -> Bool {
        for element in self where try predicate(element) {
            return true
        }

        return false
    }

    /// Check if a predicate is true for all elements of `self`
    ///
    /// - parameter predicate: The predicate called on each element of `self`
    ///
    /// - returns: True iff the predicate returns true for all elements, false otherwise

    @warn_unused_result
    func all(@noescape predicate: (Element) throws -> Bool) rethrows -> Bool {
        for item in self where try !predicate(item) {
            return false
        }

        return true
    }

    /// Check if a predicate is false for all elements of `self`
    ///
    /// - parameter predicate: The predicate called on each element of `self`
    ///
    /// - returns: True iff the predicate returns false for all elements, false otherwise

    @warn_unused_result
    func none(@noescape predicate: (Element) throws -> Bool) rethrows -> Bool {
        for element in self where try predicate(element){
            return false
        }

        return true
    }
}