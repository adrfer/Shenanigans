//
//  SequenceType.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-15.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation

public extension Sequence {
    
    // MARK: - Instance Methods
    
    /// Drop elements of `self` that satisfy a given condition
    ///
    /// - Parameter condition: The predicate called on each element of `self`
    ///
    /// - Returns: A new sequence containing all elements of `self` except those where the `condition` is `false`
    
    @discardableResult
    func drop(while condition: (Iterator.Element) throws -> Bool) rethrows -> AnySequence<Iterator.Element> {
        
        var array = Array(self)
        var generator = makeIterator()
        
        while let element = generator.next() {
            
            if try !condition(element) {
                break
            }
            
            array = Array(array.dropFirst())
        }
        
        return AnySequence(array)
    }
    
    /// Take elements of `self` that satisfy a given condition
    ///
    /// - Parameter condition: The predicate called on each element of `self`
    ///
    /// - Returns: A new sequence containing all elements of `self` for which `condition` is `true`
    
    @discardableResult
    func take(while condition: (Iterator.Element) throws -> Bool) rethrows -> AnySequence<Iterator.Element> {
        
        var array = ContiguousArray<Iterator.Element>()
        var generator = makeIterator()
        
        while let element = generator.next() {
            
            if try !condition(element) {
                break
            }
            
            array.append(element)
        }
        
        return AnySequence(array)
    }
    
    /// Find the first element of `self` that satisfies a given condition
    ///
    /// - Parameter condition: The predicate called on each element of `self`
    ///
    /// - Returns: The first element where `condition` is `true`, `nil` otherwise
    
    @discardableResult
    func find(where condition: (Iterator.Element) throws -> Bool) rethrows -> Iterator.Element? {
        
        for element in self where try condition(element) {
            return element
        }
        
        return nil
    }
    
    /// Check if at least one element of `self` satisfies a given condition
    ///
    /// - Parameter condition: The predicate called on each element of `self`
    ///
    /// - Returns: `true` iff any element in `self` satisfies `condition`, `false` otherwise
    
    @discardableResult
    func any(where condition: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        return try first(where: condition) != nil
    }
    
    /// Check if all elements of `self` satisfy a given condition
    ///
    /// - Parameter condition: The predicate called on each element of `self`
    ///
    /// - Returns: `true` iff every element in `self` satisfies `condition`, `false` otherwise
    
    @discardableResult
    func all(where condition: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        
        for element in self where try !condition(element) {
            return false
        }
        
        return true
    }
    
    /// Check if no elements of `self` satisfy a given condition
    ///
    /// - Parameter condition: The predicate called on each element of `self`
    ///
    /// - Returns: `true` iff every element in `self` does not satisfy `condition`, `false` otherwise
    
    @discardableResult
    func none(where condition: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        
        for element in self where try condition(element) {
            return false
        }
        
        return true
    }
}

public extension Sequence where Iterator.Element: Hashable {
 
    // MARK: - Instance Methods
    
    /// Get the frequencies of each element of `self`
    ///
    /// - Returns: A new dictionary where keys are the elements of `self`, and values are their frequencies
    
    @discardableResult
    func frequencies() -> [Iterator.Element: Int] {
        
        var dictionary = Dictionary<Iterator.Element, Int>()
        
        for key in self {
            dictionary[key] = dictionary[key]?.advanced(by: 1) ?? 1
        }
        
        return dictionary
    }
    
    /// Get the unique elements of `self`
    ///
    /// - Returns: A new array containing all unique elements of `self`
    
    @discardableResult
    func unique() -> [Iterator.Element] {
        
        var array = Set<Iterator.Element>()
        
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
