//
//  Array.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2017-02-09.
//  Copyright © 2017 Adriano Ferreira. All rights reserved.
//

import Foundation

public extension Array {

    // MARK: - Instance Methods

    /// Add a new element at the beginning of of a mutable array
    ///
    /// - Parameter newElement: The element to prepend to the array

    mutating func prepend(_ newElement: Element) {
        
        insert(newElement, at: 0)
    }
    
    /// Add elements of a sequence at the beginning of a mutable array
    ///
    /// - Parameter newElements: The elements to prepend to the array

//    mutating func prepend<S: Sequence>(contentsOf newElements: S) where S.Iterator.Element == Element {
//
//        insert(contentsOf: Array(newElements), at: 0)
//    }
//    
    /// Adds the elements of a collection at the beginning of a mutable array
    ///
    /// - Parameter newElements: The elements to prepend to the array

    mutating func prepend<C: Collection>(contentsOf newElements: C) where C.Iterator.Element == Element {
        
        insert(contentsOf: newElements, at: 0)
    }
}
