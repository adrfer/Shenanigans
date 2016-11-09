//
//  MutableCollectionTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2016-05-06.
//  Copyright © 2016 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest

@testable
import Shenanigans

class MutableCollectionTests: XCTestCase {
    
    func testShuffle() {
        
        var first = Array(-7 ... 7)
        let second = first
        
        first.shuffle()
        
        XCTAssertEqual(first.count, second.count)
        
        for value in second {
            XCTAssertTrue(first.contains(value))
        }
        
        XCTAssertEqual(first.sorted(), second.sorted())
    }
}
