//
//  SequenceTypeTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-03-09.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest

@testable
import Shenanigans

class SequenceTypeTests: XCTestCase {

    func testDropWhile() {
        var first = [Int]()
        var second = first.drop(while: { $0 > 7})
        XCTAssert(Array(second) == [Int]())

        first = Array(1 ... 7)
        second = first.drop(while: { $0 > 0})
        XCTAssert(Array(second) == [Int]())

        first = Array(-7 ... 7)
        second = first.drop(while: { $0 <= 0})
        XCTAssert(Array(second) == Array(1 ... 7))
    }

    func testTakeWhile() {
        var first = [Int]()
        var second = first.take(while: { $0 > 7})
        XCTAssert(Array(second) == [Int]())

        first = Array(1 ... 7)
        second = first.take(while: { $0 < 0})
        XCTAssert(Array(second) == [Int]())

        first = Array(-7 ... 7)
        second = first.take(while: { $0 <= 0})
        XCTAssert(Array(second) == Array(-7 ... 0))
    }

    func testFrequencies() {

        let array = [1, 1, 2, 3, 3, 7, 7, 7]
        XCTAssertEqual([1: 2, 2: 1, 3: 2, 7: 3], array.frequencies())

        let strings = ["A", "AB", "A", "ABC", "AB", "A"]
        XCTAssertEqual(["A": 3, "AB": 2, "ABC": 1], strings.frequencies())
    }
}