//
//  Bool.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-03.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation

public extension Bool {

    // MARK: - Instance Methods

    /// Toggle a bool value
    ///
    /// - returns: A toggled bool
    
    mutating func toggle() -> Bool {
        self = !self
        return self
    }
}