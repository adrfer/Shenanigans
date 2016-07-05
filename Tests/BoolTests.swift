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

    func testToggle() {

        var value = false

        value.toggle()
        XCTAssertTrue(value)

        value.toggle()
        XCTAssertFalse(value)
    }

    func testToggled() {

        var value = false
        XCTAssertTrue(value.toggled())

        value = true
        XCTAssertFalse(value.toggled())
    }

    func testRandom() {

        7.times {
            let value = Bool.random()

            XCTAssertTrue([true, false].contains(value))

            if value {
                XCTAssertFalse(value.toggled())
            } else {
                XCTAssertTrue(value.toggled())
            }
        }
    }
}
