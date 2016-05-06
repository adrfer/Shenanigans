//
//  BoolTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-03.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest

@testable
import Shenanigans

class BoolTests: XCTestCase {

    func testToggleInPlace() {
        var value = false

        value.toggleInPlace()
        XCTAssertTrue(value)

        value.toggleInPlace()
        XCTAssertFalse(value)
    }

    func testToggle() {
        var value = false
        XCTAssertTrue(value.toggle())

        value = true
        XCTAssertFalse(value.toggle())
    }

    func testRandom() {
        7.times {
            let value = Bool.random()

            XCTAssertTrue([true, false].contains(value))

            if value {
                XCTAssertFalse(value.toggle())
            } else {
                XCTAssertTrue(value.toggle())
            }
        }
    }
}