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

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

    func testIsEven() {
        for int in [-2, 0, 2, 4] { XCTAssertTrue(int.isEven) }
        for int in [-1, 3, 5, 7] { XCTAssertFalse(int.isEven) }
    }
}