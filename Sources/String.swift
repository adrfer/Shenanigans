//
//  String.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-05-23.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//
import Swift
public extension String {
    
    // MARK: - Instance Properties
    
    /// Count the number of characters in `self`
    ///
    /// - Returns: The lenght of `self`
    
    var count: Int {
        return characters.count
    }

    // MARK: - Instance Methods
    
    /// Create a reversed version of `self`
    ///
    /// - Returns: A reversed copy of `self`
    
    func reversed() -> String {

        return String(characters.reversed())
    }
    
    ///  Truncate `self` down to a specific number of characters
    ///
    /// - Parameters:
    ///
    ///   - count: The required string length after truncating
    ///   - trailing: The optional trailing characters to be appended
    ///
    /// - Returns: A new truncated string with optional trailing characters appended
    
    @discardableResult
    func truncated(after count: Int, trailing: String? = "...") -> String {
        
        guard !isEmpty && characters.count > count else {
            return self
        }
        
        return substring(to: index(startIndex, offsetBy: count)) + (trailing ?? "")
    }

    /// Create a snakecased version of `self`
    ///
    /// - Returns: A snakecased copy of `self`
    
    func snakecased() -> String {
        var charactersToRemove = CharacterSet.alphanumerics.inverted
        charactersToRemove.remove(charactersIn: " ")
        
        let result = components(separatedBy: charactersToRemove).joined(separator: "")
        return result.replacingOccurrences(of: " ", with: "_").lowercased()
    }
}
