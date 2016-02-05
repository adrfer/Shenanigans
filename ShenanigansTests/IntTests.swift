//
//  IntTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-01-31.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation

import XCTest
@testable import Shenanigans

class ShenanigansTests: XCTestCase {

    func testIsEven() {
        [-2, 0, 2, 4].forEach {
            XCTAssertTrue($0.isEven)
        }

        [-1, 3, 5, 7].forEach {
            XCTAssertFalse($0.isEven)
        }
    }

    func testIsOdd() {
        [-2, 0, 2, 4].forEach {
            XCTAssertFalse($0.isOdd)
        }

        [-1, 3, 5, 7].forEach {
            XCTAssertTrue($0.isOdd)
        }
    }

    func testIsPositive() {
        [1, 7].forEach {
            XCTAssertTrue($0.isPositive)
        }

        [-1, -7].forEach {
            XCTAssertFalse($0.isPositive)
        }
    }

    func testIsNegative() {
        [0, 1, 7].forEach {
            XCTAssertFalse($0.isNegative)
        }

        [-1, -7].forEach {
            XCTAssertTrue($0.isNegative)
        }
    }

    func testTimes() {
        var count: Int

        count = 0
        (-7).times { count += 1 }
        XCTAssertEqual(0, count)

        count = 0
        0.times { count += 1 }
        XCTAssertEqual(0, count)

        count = 0
        7.times { count += 1 }
        XCTAssertEqual(7, count)
    }

    func testRandom() {
        7.times {
            var random = Int.random(from: -7, to: 7)

            XCTAssertGreaterThanOrEqual(random, -7)
            XCTAssertLessThanOrEqual(random, 7)

            random = Int.random(from: 0, to: 0)
            XCTAssertEqual(random, 0)

            random = Int.random(from: 0, to: 7)
            XCTAssertGreaterThanOrEqual(random, 0)
            XCTAssertLessThanOrEqual(random, 7)
        }
    }
}