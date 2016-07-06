//
//  CollectionTypeTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-29.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest

@testable
import Shenanigans

class CollectionTests: XCTestCase {

    func testShuffled() {

        let first = Array(-7 ... 7)
        let second = first.shuffled()

        XCTAssertEqual(first.count, second.count)

        for value in first {
            XCTAssertTrue(second.contains(value))
        }

        XCTAssertEqual(first.sorted(), second.sorted())
    }

    func testSampled() {

        var first = [Int]()
        var second = first.sampled()
        XCTAssertNil(second)

        first = Array(-7 ... 7)
        second = first.sampled()
        XCTAssertNotNil(second)
        XCTAssertTrue(first.contains(second!))
    }

    func testSubscript() {

        let array = [1, 2, 3]

        XCTAssertEqual([1, 2, 3], array[clamping: 0 ..< 5])
        XCTAssertEqual([1, 2], array[clamping: -1 ..< 2])
        XCTAssertEqual([2], array[clamping: 1 ..< 2])
        XCTAssertEqual([], array[clamping: 3 ..< 4])
//        XCTAssertEqual([3], array[clamping: 2 ... 4])

        XCTAssertNil(array[checking: -2 ..< -1])
        XCTAssertNil(array[checking: -1 ..< 2])
//        XCTAssertNil(array[checking: -1 ... 4])
        XCTAssertNil(array[checking: 2 ..< 5])
//        XCTAssertNil(array[checking: 3 ... 5])

        XCTAssertEqual([1, 2, 3], array[checking: 0 ..< 3]!)
//        XCTAssertEqual([2, 3], array[checking: 1 ... 2]!)
        XCTAssertEqual([2], array[checking: 1 ..< 2]!)

        XCTAssertNil(array[checking: -1])
        XCTAssertNil(array[checking: 3])
        XCTAssertEqual(2, array[checking: 1])
    }
}
