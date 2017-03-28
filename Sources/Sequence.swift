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
    
    /// Drop elements of `self` that satisfy a given predicate
    ///
    /// - Parameter predicate: The condition called on each element of `self`
    ///
    /// - Returns: A new sequence containing all elements of `self` but those where `predicate` is `false`
    
    @discardableResult
    func drop(while predicate: (Iterator.Element) throws -> Bool) rethrows -> AnySequence<Iterator.Element> {
        
        var array = Array(self)
        
        for element in self {
            
            if try !predicate(element) {
                break
            }
            
            array = Array(array.dropFirst())
        }
        
        return AnySequence(array)
    }
    
    /// Take elements of `self` that satisfy a given predicate
    ///
    /// - Parameter predicate: The condition called on each element of `self`
    ///
    /// - Returns: A new sequence containing elements of `self` where `predicate` is `true`
    
    @discardableResult
    func take(while predicate: (Iterator.Element) throws -> Bool) rethrows -> AnySequence<Iterator.Element> {

        var array = Array<Iterator.Element>()
        
        for element in self {
            
            if try !predicate(element) {
                break
            }
        
            array.append(element)
        }
        
        return AnySequence(array)
    }

    
    /// Count elements of `self` that satisfy a given predicate
    ///
    /// - Parameter predicate: The condition called on each element of `self`
    ///
    /// - Returns: The number of elements of `self` where `predicate` is `true`
    
    func count(while predicate: (Iterator.Element) -> Bool) -> Int {
        
        var count = 0
        
        for element in self where predicate(element) {
            count += 1
        }
        
        return count
    }
    
    
    /// Find elements of `self` that satisfy a given predicate
    ///
    /// - Parameter predicate: The condition called on each element of `self`
    ///
    /// - Returns: A new sequence containing elements of `self` where `predicate` is `true`
    
    @discardableResult
    func find(where predicate: (Iterator.Element) -> Bool) -> AnySequence<Iterator.Element> {
        
        var array = Array<Iterator.Element>()
        
        for element in self where predicate(element) {
            array.append(element)
        }
        
        return AnySequence(array)
    }
    
    /// Check if at least one element of `self` satisfies a given predicate
    ///
    /// - Parameter predicate: The condition called on each element of `self`
    ///
    /// - Returns: `true` iff any element of `self` satisfies the `predicate`, `false` otherwise
    
    @discardableResult
    func any(where predicate: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        
        return try first(where: predicate) != nil
    }
    
    /// Check if no elements of `self` satisfy a given predicate
    ///
    /// - Parameter predicate: The condition called on each element of `self`
    ///
    /// - Returns: `true` iff every element of `self` does not satisfy the `predicate`, `false` otherwise
    
    @discardableResult
    func none(where predicate: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        
        return try first(where: predicate) == nil
    }

    
    /// Check if all elements of `self` satisfy a given predicate
    ///
    /// - Parameter predicate: The condition called on each element of `self`
    ///
    /// - Returns: `true` iff every element of `self` satisfies the `predicate`, `false` otherwise
    
    @discardableResult
    func all(where predicate: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        
        for element in self where try !predicate(element) {
            return false
        }
        
        return true
    }
}

public extension Sequence where Iterator.Element: Hashable {
 
    // MARK: - Instance Methods
    
    /// Retrieve the frequency of each element of `self`
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
    
    /// Retrieve all unique elements of `self`
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
