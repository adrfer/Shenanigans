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

class CollectionTypeTests: XCTestCase {

    func testShuffle() {
        let first = Array(-7...7)
        let second = first.shuffle()

        XCTAssertEqual(first.count, second.count)

        for value in first {
            XCTAssertTrue(second.contains(value))
        }

        XCTAssertEqual(first.sort(), second.sort())
    }

    func testSample() {
        var first = [Int]()
        var second = first.sample()
        XCTAssertNil(second)

        first = Array(-7...7)
        second = first.sample()
        XCTAssertNotNil(second)
        XCTAssertTrue(first.contains(second!))
    }
}