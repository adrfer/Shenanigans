//
//  ArrayTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-04.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest
@testable import Shenanigans

class ArrayTests: XCTestCase {

    func testHead() {
        var array = [Int]()
        XCTAssertNil(array.head)

        array = [7]
        XCTAssertEqual(array.head, 7)

        array = [0, 1, 2, 3]
        XCTAssertEqual(array.head, 0)
    }

    func testTail() {
        var array = [Int]()
        XCTAssertNil(array.tail)
    
        array = [7]
        XCTAssertEqual(array.tail!, [])
    
        array = [0, 1, 2, 3]
        XCTAssertEqual(array.tail!, [1, 2, 3])
    }
}