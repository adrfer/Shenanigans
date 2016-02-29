//
//  CollectionTypeTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-02-29.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest
@testable import Shenanigans

class CollectionTypeTests: XCTestCase {

    func testShuffle() {
        let array = [3, 1, 0, 2, 1]
        let shuffled = array.shuffle()

        XCTAssertEqual(array.count, shuffled.count)

        array.forEach {
            XCTAssertTrue(shuffled.contains($0))
        }

        XCTAssertEqual(array.sort(), shuffled.sort())
    }
}