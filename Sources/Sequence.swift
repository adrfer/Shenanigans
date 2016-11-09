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
    
    /// Drop elements of `self` that satisfy the given predicate
    ///
    /// - Parameter predicate: The predicate called on each element of `self`
    ///
    /// - Returns: A subsequence containing all elements of `self` but those the predicate was false
    
    @discardableResult
    func drop(while predicate: (Iterator.Element) throws -> Bool) rethrows -> AnySequence<Iterator.Element> {
        
        var array = Array(self)
        var generator = makeIterator()
        
        while let element = generator.next() {
            
            if try !predicate(element) {
                break
            }
            
            array = Array(array.dropFirst())
        }
        
        return AnySequence(array)
    }
    
    /// Take elements of `self` that satisfy the given predicate
    ///
    /// - Parameter predicate: The predicate called on each element of `self`
    ///
    /// - Returns: A new array containing all elements of `self` for which the predicate was true
    
    @discardableResult
    func take(while predicate: (Iterator.Element) throws -> Bool) rethrows -> AnySequence<Iterator.Element> {
        
        var array = ContiguousArray<Iterator.Element>()
        var generator = makeIterator()
        
        while let element = generator.next() {
            
            if try !predicate(element) {
                break
            }
            
            array.append(element)
        }
        
        return AnySequence(array)
    }
    
    /// Find the first element of `self` that satisfies the given predicate
    ///
    /// - Parameter predicate: The predicate called on each element of `self`
    ///
    /// - Returns: The first element where `predicate` is `true`, `nil` otherwise
    
    @discardableResult
    func find(where predicate: (Iterator.Element) throws -> Bool) rethrows -> Iterator.Element? {
        
        for element in self where try predicate(element) {
            return element
        }
        
        return nil
    }
    
    /// Check if at least one element of `self` satisfies the given predicate
    ///
    /// - Parameter predicate: The predicate called on each element of `self`
    ///
    /// - Returns: True iff any element in `self` satisfies `predicate`, false otherwise
    
    @discardableResult
    func any(where predicate: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        
        for element in self where try predicate(element) {
            return true
        }
        
        return false
    }
    
    /// Check if all elements of `self` satisfy a given predicate the given predicate
    ///
    /// - Parameter predicate: The predicate called on each element of `self`
    ///
    /// - Returns: True iff every element in `self` satisfies `predicate`, false otherwise
    
    @discardableResult
    func all(where predicate: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        
        for element in self where try !predicate(element) {
            return false
        }
        
        return true
    }
    
    /// Check if none elements of `self` satisfy a given predicate the given predicate
    ///
    /// - Parameter predicate: The predicate called on each element of `self`
    ///
    /// - Returns: True iff every element in `self` does not satisfy `predicate`, false otherwise
    
    @discardableResult
    func none(where predicate: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        
        for element in self where try predicate(element) {
            return false
        }
        
        return true
    }
}

public extension Sequence where Iterator.Element: Hashable {
 
    // MARK: - Instance Methods
    
    /// Get the frequencies of the elements of `self`
    ///
    /// - Returns: A dictionary where the keys are the elements of `self`, and the values are their frequencies
    
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
    /// - Returns: All unique elements of `self`
    ///
    /// - Note: Alternatively, one could pass the sequence to Set to remove duplicates
    
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
