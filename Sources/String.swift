//
//  String.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-05-23.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation

public extension String {

    ///  Truncate a string down to a specific number of characters
    ///
    /// - Parameters:
    ///
    ///   - count: The required string length after truncating
    ///   - trailing: The optional trailing characters to be appended
    ///
    /// - Returns: A new truncated string with optional trailing characters appended

    @warn_unused_result
    func truncated(after count: Int, trailing: String? = "...") -> String {

        guard !isEmpty && characters.count > count else {
            return self
        }

        return substring(to: index(startIndex, offsetBy: count)) + (trailing ?? "")
    }
}
