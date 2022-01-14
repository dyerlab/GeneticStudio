//
//  LocusTests.swift
//  Tests macOS
//
//  Created by Rodney Dyer on 11/28/21.
//

import XCTest

final class LocusTests: XCTestCase {
   

    func testProperties() throws {

        let locNull = Locus()
        let locHap = Locus(raw: "A")
        let locAA  = Locus(raw: "A:A")
        let locAB  = Locus(raw: "A:B")
        let locAC  = Locus(raw: "C:A")
        
        XCTAssertEqual( locNull.ploidy, 0 )
        XCTAssertEqual( locNull.isEmpty, true )
        XCTAssertEqual( locNull.isHeterozygote, false )
        
        XCTAssertEqual( locHap.ploidy, 1 )
        XCTAssertEqual( locHap.isEmpty, false )
        XCTAssertEqual( locHap.isHeterozygote, false )
        
        XCTAssertEqual( locAA.isHeterozygote, false )
        XCTAssertEqual( locAC.isHeterozygote, true )
        
        XCTAssertEqual( locAA, locAA )
        XCTAssertNotEqual( locAA, locAB )
        
    }
    

    
}
