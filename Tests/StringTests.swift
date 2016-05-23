//
//  StringTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-05-23.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest

@testable
import Shenanigans

class StringTests: XCTestCase {

    func testTruncate() {
        var value = ""
        XCTAssertEqual(value.truncate(after: 7), "")

        value = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        XCTAssertEqual(value.truncate(after: 100), value)
        XCTAssertEqual(value.truncate(after: 7), "Lorem i...")
        XCTAssertEqual(value.truncate(after: 7, trailing: nil), "Lorem i")
        XCTAssertEqual(value.truncate(after: 7, trailing: "...."), "Lorem i....")
    }
}