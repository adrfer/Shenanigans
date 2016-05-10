//
//  IntTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-01-31.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest

@testable
import Shenanigans

class ShenanigansTests: XCTestCase {

    func testIsEven() {
        for value in (-2).stride(through: 4, by: 2) {
            XCTAssertTrue(value.isEven)
        }

        for value in (-1).stride(through: 7, by: 2) {
            XCTAssertFalse(value.isEven)
        }
    }

    func testIsOdd() {
        for value in (-2).stride(through: 4, by: 2) {
            XCTAssertFalse(value.isOdd)
        }

        for value in (-1).stride(through: 7, by: 2) {
            XCTAssertTrue(value.isOdd)
        }
    }

    func testIsPositive() {
        for value in (1).stride(through: 4, by: 1) {
            XCTAssertTrue(value.isPositive)
        }

        XCTAssertFalse(0.isPositive)

        for value in (-7).stride(through: -1, by: 2) {
            XCTAssertFalse(value.isPositive)
        }
    }

    func testIsNegative() {
        for value in (1).stride(through: 4, by: 1) {
            XCTAssertFalse(value.isNegative)
        }

        XCTAssertFalse(0.isNegative)

        for value in (-7).stride(through: -1, by: 2) {
            XCTAssertTrue(value.isNegative)
        }
    }

    func testIsNonPositive() {
        for value in (1).stride(through: 4, by: 1) {
            XCTAssertTrue(value.isNonPositive)
        }

        XCTAssertTrue(0.isNonPositive)

        for value in (-7).stride(through: -1, by: 2) {
            XCTAssertFalse(value.isNonPositive)
        }
    }

    func testIsNonNegative() {
        for value in (1).stride(through: 4, by: 1) {
            XCTAssertFalse(value.isNonNegative)
        }

        XCTAssertTrue(0.isNonNegative)

        for value in (-7).stride(through: -1, by: 2) {
            XCTAssertTrue(value.isNonNegative)
        }
    }

    func testIsNonZero() {
        for value in (1).stride(through: 4, by: 1) {
            XCTAssertTrue(value.isNonZero)
        }

        XCTAssertFalse(0.isNonZero)
    }

    func testTimes() {
        var value: Int

        value = 0
        (-7).times { value += 1 }
        XCTAssertEqual(0, value)

        value = 0
        0.times { value += 1 }
        XCTAssertEqual(0, value)

        value = 0
        7.times { value += 1 }
        XCTAssertEqual(7, value)
    }

    func testIsDivisible() {
        for value in (-1).stride(through: 1, by: 1) {
            XCTAssertFalse(value.isDivisible(by: 0))
        }

        for value in (-7).stride(through: 7, by: 1) {
            XCTAssertTrue(value.isDivisible(by: 1))
        }

        for value in (-2).stride(through: 2, by: 2) {
            XCTAssertTrue(value.isDivisible(by: 2))
        }
    }

    func testRandom() {
        7.times {
            var value = Int.random(from: -7, to: 7)

            XCTAssertGreaterThanOrEqual(value, -7)
            XCTAssertLessThanOrEqual(value, 7)

            value = Int.random(from: 0, to: 0)
            XCTAssertEqual(value, 0)

            value = Int.random(from: 0, to: 7)
            XCTAssertGreaterThanOrEqual(value, 0)
            XCTAssertLessThanOrEqual(value, 7)
        }
    }
}