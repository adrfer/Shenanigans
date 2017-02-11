//
//  ArrayTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2017-02-09.
//  Copyright © 2017 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest
import Swift
@testable
import Shenanigans

class ArrayTests: XCTestCase {
    
    func testPrepend() {
    
        var numbers = [1, 2, 3, 4, 5]
        numbers.prepend(0)
        XCTAssertEqual(numbers, Array(0 ... 5))
        
        numbers = [1, 2, 3, 4, 5]
        numbers.prepend(contentsOf: 6 ... 10)
        XCTAssertEqual(numbers, Array(6 ... 10) + Array(1 ... 5))
    }
}
