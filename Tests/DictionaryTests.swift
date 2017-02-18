//
//  DictionaryTests.swift
//  Shenanigans
//
//  Created by Adriano Ferreira on 2017-02-17.
//  Copyright © 2017 Adriano Ferreira. All rights reserved.
//

import Foundation
import XCTest

@testable
import Shenanigans

class DictionaryTests: XCTestCase {
    
    func testHas() {
        
        let dictionary = ["a": 1, "b": 2, "c": 3]

        XCTAssertTrue(dictionary.has(key: "b"))
        XCTAssertFalse(dictionary.has(key: "d"))
    }
}
