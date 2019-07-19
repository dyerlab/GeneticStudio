//
//  ArrayTests.swift
//  CommonTests
//
//  Created by Rodney Dyer on 6/14/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class ArrayTests: XCTestCase {

    func testArray() {
        
        let x = [1,2,3,4,5]
        
        let y = x.randomElement()!
        XCTAssertTrue( x.contains(y) )
    
    }


}
