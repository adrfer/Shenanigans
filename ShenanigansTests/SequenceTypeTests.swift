//
//  SequenceTypeTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-03-09.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest
@testable import Shenanigans

class SequenceTypeTests: XCTestCase {

    func testFrequencies() {

        let array = [1, 1, 2, 3, 3, 7, 7, 7]
        XCTAssertEqual([1: 2, 2: 1, 3: 2, 7: 3], array.frequencies())
    }
}