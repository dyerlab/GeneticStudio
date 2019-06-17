//
//  ArrayTests.swift
//  PopgenKitTests
//
//  Created by Rodney Dyer on 6/13/19.
//

import XCTest

class ArrayTests: XCTestCase {

    func testArray() {

        let abc = ["A","B","C"]
        
        XCTAssertTrue( abc.contains( abc.randomElement()! ) )
        
    }


}
