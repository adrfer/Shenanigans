//
//  BoolTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-03.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest
@testable import Shenanigans

class BoolTests: XCTestCase {

    func testToggle() {
        var bool: Bool

        bool = false
        XCTAssertTrue(bool.toggle())

        bool = true
        XCTAssertFalse(bool.toggle())
    }
}