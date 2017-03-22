//
//  SequenceTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-03-09.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest

@testable
import Shenanigans

class SequenceTests: XCTestCase {
    
    func testDrop() {
        
        XCTAssertEqual(Array([Int]().drop(while: { $0 > 7 })), [Int]())
        XCTAssertEqual(Array(Array(1 ... 7).drop(while: { $0 > 0 })), [Int]())
        XCTAssertEqual(Array(Array(-7 ... 7).drop(while: { $0 <= 0 })), Array(1 ... 7))
    }
    
    func testTake() {
        
        XCTAssertEqual(Array([Int]().take(while: { $0 > 7 })), [Int]())
        XCTAssertEqual(Array(Array(1 ... 7).take(while: { $0 < 0 })), [Int]())
        XCTAssertEqual(Array(Array(-7 ... 7).take(while: { $0 <= 0 })), Array(-7 ... 0))
    }
    
    func testCount() {
        
        XCTAssertEqual([Int]().count(while: { $0 > 7 }), 0)
        XCTAssertEqual(Array(1 ... 7).count(while: { $0 < 0 }), 0)
        XCTAssertEqual(Array(-7 ... 7).count(while: { $0 <= 0 }), 8)
    }
    
    func testFind() {
        
        XCTAssertNil([Int]().find(where: { $0 > 7}))
        XCTAssertNil(Array(-7 ... 7).find(where: { $0 < -7 }))
        XCTAssertEqual(Array(0 ... 7).find(where: { $0 > 0 }), 1)
    }
    
    func testAny() {
        
        XCTAssertFalse([Int]().any(where: { $0 > 7 }))
        XCTAssertFalse(Array(1 ... 7).any(where: { $0.isNegative }))
        XCTAssertTrue(Array(-7 ... 7).any(where: { $0 < 0 }))
    }
    
    func testAll() {
        
        XCTAssertTrue([Int]().all(where: { $0 > 7 }))
        XCTAssertTrue(Array(1 ... 7).all(where: { $0 > 0 }))
        XCTAssertFalse(Array(-7 ... 7).all(where: { $0 < 0 }))
    }
    
    func testNone() {
        
        XCTAssertTrue([Int]().none(where: { $0 > 7 }))
        XCTAssertFalse(Array(1 ... 7).none(where: { $0.isPositive }))
        XCTAssertTrue(Array(-7 ... -1).none(where: { $0 > 0 }))
    }
    
    func testFrequencies() {
        
        XCTAssertEqual([1, 1, 2, 3, 3, 7, 7, 7].frequencies(), [1: 2, 2: 1, 3: 2, 7: 3])
        XCTAssertEqual(["A", "AB", "A", "ABC", "AB", "A"].frequencies(), ["A": 3, "AB": 2, "ABC": 1])
    }
    
    func testUnique() {
        
        XCTAssertEqual([1, 1, 2, 3, 3, 7, 7, 7].unique(), [1, 2, 3, 7])
        XCTAssertEqual(["A", "AB", "A", "ABC", "AB", "A"].unique(), ["A", "AB", "ABC"])
    }
}
