//
//  Dictionary.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2017-02-17.
//  Copyright © 2017 Adriano Ferreira. All rights reserved.
//

import Foundation

public extension Dictionary {
    
    // MARK: - Instance Methods
    
    /// Check if given key exists in `self`
    ///
    /// - Parameter key: The key to search for
    ///
    /// - Returns: `true` iff `self` contains given key, `false` otherwise
    
    func has(key: Key) -> Bool {
        
        return index(forKey: key) != nil
    }
}
