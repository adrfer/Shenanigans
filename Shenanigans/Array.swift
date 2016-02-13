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

    func decompose() -> (Element?, [Element]?) {
        return (head, tail)
    }

    /// Shuffle the elements of `self`
    ///
    /// - returns: A copy of `self` with its elements shuffled

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

    func none(@noescape predicate: (Element) throws -> Bool) rethrows -> Bool {
        for element in self where try predicate(element){
            return false
        }

        return true
    }

    /// Drop elements of `self` while a predicate is true
    ///
    /// - parameter predicate: The predicate called on each element of `self`
    ///
    /// - returns: A new array containing all elements of `self` but those the predicate was false

    func dropWhile(predicate: (Element) -> Bool) -> [Element] {

        guard !self.isEmpty else { return self }

        var array = self

        for element in array {
            if !predicate(element) { break }
            array = Array(array.dropFirst())
        }

        return array
    }

    /// Take elements of `self` while a predicate is true
    ///
    /// - parameter predicate: The predicate called on each element of `self`
    ///
    /// - returns: A new array containing all elements of `self` for which the predicate was true

    func takeWhile(predicate: (Element) -> Bool) -> [Element] {

        guard !self.isEmpty else { return self }

        var array = [Element]()

        for element in self where predicate(element) {
            array.append(element)
        }

        return array
    }
}