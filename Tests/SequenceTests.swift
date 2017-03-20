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
        
        var first = [Int]()
        var second = first.drop(while: { $0 > 7 })
        XCTAssertEqual(Array(second), [Int]())
        
        first = Array(1 ... 7)
        second = first.drop(while: { $0 > 0 })
        XCTAssertEqual(Array(second), [Int]())
        
        first = Array(-7 ... 7)
        second = first.drop(while: { $0 <= 0 })
        XCTAssertEqual(Array(second), Array(1 ... 7))
    }
    
    func testTake() {
        
        var first = [Int]()
        var second = first.take(while: { $0 > 7 })
        XCTAssertEqual(Array(second), [Int]())
        
        first = Array(1 ... 7)
        second = first.take(while: { $0 < 0 })
        XCTAssertEqual(Array(second), [Int]())
        
        first = Array(-7 ... 7)
        second = first.take(while: { $0 <= 0 })
        XCTAssertEqual(Array(second), Array(-7 ... 0))
    }
    
    func testCount() {

        XCTAssertEqual([Int]().count(while: { $0 > 7 }), 0)
        XCTAssertEqual(Array(1 ... 7).count(while: { $0 < 0 }), 0)
        XCTAssertEqual(Array(-7 ... 7).count(while: { $0 <= 0 }), 8)
    }
    
    func testFind() {
        
        var first = [Int]()
        var second = first.find(where: { $0 > 7})
        XCTAssertNil(second)
        
        first = Array(-7 ... 7)
        second = first.find(where: { $0 < -7 })
        XCTAssertNil(second)
        
        first = Array(0 ... 7)
        second = first.find(where: { $0 > 0 })
        XCTAssertEqual(second, 1)
    }
    
    func testAny() {
        
        var first = [Int]()
        var second = first.any(where: { $0 > 7 })
        XCTAssertFalse(second)
        
        first = Array(1 ... 7)
        second = first.any(where: { $0.isNegative })
        XCTAssertFalse(second)
        
        first = Array(-7 ... 7)
        second = first.any(where: { $0 < 0 })
        XCTAssertTrue(second)
    }
    
    func testAll() {
        
        var first = [Int]()
        var second = first.all(where: { $0 > 7 })
        XCTAssertTrue(second)
        
        first = Array(1 ... 7)
        second = first.all(where: { $0 > 0 })
        XCTAssertTrue(second)
        
        first = Array(-7 ... 7)
        second = first.all(where: { $0 < 0 })
        XCTAssertFalse(second)
    }
    
    func testNone() {
        
        var first = [Int]()
        var second = first.none(where: { $0 > 7 })
        XCTAssertTrue(second)
        
        first = Array(1 ... 7)
        second = first.none(where: { $0.isPositive })
        XCTAssertFalse(second)
        
        first = Array(-7 ... -1)
        second = first.none(where: { $0 > 0 })
        XCTAssertTrue(second)
    }
    
    func testFrequencies() {
        
        let first = [1, 1, 2, 3, 3, 7, 7, 7]
        XCTAssertEqual([1: 2, 2: 1, 3: 2, 7: 3], first.frequencies())
        
        let second = ["A", "AB", "A", "ABC", "AB", "A"]
        XCTAssertEqual(["A": 3, "AB": 2, "ABC": 1], second.frequencies())
    }
    
    func testUnique() {
        
        let first = [1, 1, 2, 3, 3, 7, 7, 7]
        XCTAssertEqual([1, 2, 3, 7], first.unique())
        
        let second = ["A", "AB", "A", "ABC", "AB", "A"]
        XCTAssertEqual(["A", "AB", "ABC"], second.unique())
    }
}
