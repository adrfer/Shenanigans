//
//  IntTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-05-06.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest

@testable
import Shenanigans

class MutableCollectionType: XCTestCase {

    func testShuffleInPlace() {
        var first = Array(-7 ... 7)
        let second = first

        first.shuffleInPlace()

        XCTAssertEqual(first.count, second.count)

        for value in second {
            XCTAssertTrue(first.contains(value))
        }

        XCTAssertEqual(first.sort(), second.sort())
    }
}