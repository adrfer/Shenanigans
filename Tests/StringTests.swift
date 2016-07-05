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

    func testTruncated() {

        var value = ""
        XCTAssertEqual(value.truncated(after: 7), "")

        value = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        XCTAssertEqual(value.truncated(after: 100), value)
        XCTAssertEqual(value.truncated(after: 7), "Lorem i...")
        XCTAssertEqual(value.truncated(after: 7, trailing: nil), "Lorem i")
        XCTAssertEqual(value.truncated(after: 7, trailing: "...."), "Lorem i....")
    }
}
