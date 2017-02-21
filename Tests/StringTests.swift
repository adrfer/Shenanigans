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
    
    func testCount() {
        
        XCTAssertEqual("".count, 0)
        XCTAssertEqual("7".count, 1)
        XCTAssertEqual("👍".count, 1)
        XCTAssertEqual("👍👍👍".count, 3)
        XCTAssertEqual("Lorem ipsum...".count, 14)
    }

    func testReversed() {
        
        XCTAssertEqual("".reversed(), "")
        XCTAssertEqual(" ".reversed(), " ")
        XCTAssertEqual("  ".reversed(), "  ")
        
        XCTAssertEqual("Lorem ipsum".reversed(), "muspi meroL")
        XCTAssertEqual("Lorem... ipsum!".reversed(), "!muspi ...meroL")
        XCTAssertEqual("Lorem!  ipsum!".reversed(), "!muspi  !meroL")
        XCTAssertEqual("L o r e m i p s u m".reversed(), "m u s p i m e r o L")
        XCTAssertEqual("_LoReM_ _IpSuM_".reversed(), "_MuSpI_ _MeRoL_")
    }
    
    func testTruncated() {
        
        var value = ""
        XCTAssertEqual(value.truncated(after: 7), "")
        
        value = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        XCTAssertEqual(value.truncated(after: 100), value)
        XCTAssertEqual(value.truncated(after: 7), "Lorem i...")
        XCTAssertEqual(value.truncated(after: 7, trailing: nil), "Lorem i")
        XCTAssertEqual(value.truncated(after: 7, trailing: "...."), "Lorem i....")
    }
    
    func testSnakecased() {
        
        XCTAssertEqual("".snakecased(), "")
        XCTAssertEqual(" ".snakecased(), "_")
        XCTAssertEqual("  ".snakecased(), "__")
        
        XCTAssertEqual("Lorem ipsum".snakecased(), "lorem_ipsum")
        XCTAssertEqual("Lorem... ipsum!".snakecased(), "lorem_ipsum")
        XCTAssertEqual("Lorem!  ipsum!".snakecased(), "lorem__ipsum")
        XCTAssertEqual("L o r e m i p s u m".snakecased(), "l_o_r_e_m_i_p_s_u_m")
        XCTAssertEqual("_LoReM_ _IpSuM_".snakecased(), "_lorem___ipsum_")
    }
    
    func testIsUppercased() {
        
        XCTAssertTrue("".isUppercased())
        XCTAssertTrue(" ".isUppercased())
        XCTAssertTrue("  ".isUppercased())
        
        XCTAssertFalse("Lorem ipsum".isUppercased())
        XCTAssertFalse("lorem ipsum".isUppercased())
        
        XCTAssertTrue("LOREM IPSUM".isUppercased())
        XCTAssertTrue("LOREM!  IPSUM!".isUppercased())
        XCTAssertTrue("L O R E M I P S U M".isUppercased())
        XCTAssertTrue("_LOREM_ _IPSUM_".isUppercased())
    }

    func testIsLowercased() {
        
        XCTAssertTrue("".isLowercased())
        XCTAssertTrue(" ".isLowercased())
        XCTAssertTrue("  ".isLowercased())
        
        XCTAssertFalse("Lorem ipsum".isLowercased())
        XCTAssertFalse("LOREM IPSUM".isLowercased())
        
        XCTAssertTrue("lorem ipsum".isLowercased())
        XCTAssertTrue("lorem!  ipsum!".isLowercased())
        XCTAssertTrue("l o r e m i p s u m".isLowercased())
        XCTAssertTrue("_lorem_ _ipsum_".isLowercased())
    }

    func testIsSnakecased() {
        
        XCTAssertTrue("".isSnakecased())
        XCTAssertTrue("_".isSnakecased())
        XCTAssertTrue("__".isSnakecased())
        
        XCTAssertFalse("lorem ipsum".isSnakecased())
        XCTAssertFalse("Lorem Ipsum".isSnakecased())
        XCTAssertFalse("Lorem... ipsum!".isSnakecased())
        XCTAssertFalse("Lorem!  ipsum!".isSnakecased())
        XCTAssertFalse("L o r e m i p s u m".isSnakecased())
        XCTAssertFalse("_LoReM_ _IpSuM_".isSnakecased())
        XCTAssertFalse("LOREM IPSUM".isSnakecased())
        
        XCTAssertTrue("lorem_ipsum".isSnakecased())
        XCTAssertTrue("lorem__ipsum".isSnakecased())
        XCTAssertTrue("l_o_r_e_m_i_p_s_u_m".isSnakecased())
    }
}
