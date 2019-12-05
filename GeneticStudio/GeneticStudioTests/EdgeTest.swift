//
//  EdgeTest.swift
//  DLabPopgraphKitTests
//
//  Created by Rodney Dyer on 7/19/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class EdgeTest: XCTestCase {

    func testEdge() {
        
        let n1 = Node(label: "Bob", size: 12.0 )
        let n2 = Node(label: "Alice", size: 13.4)
        
        let e = Edge(from: n1, to: n2, weight: 42.0 )
        
        XCTAssertEqual( e.weight, 42.0 )
        
        XCTAssertEqual( e.connectedTo(node: n1), n2 )
        XCTAssertEqual( e.connectedTo(node: n2), n1 )
        
        XCTAssertTrue( e.connects(from: "Bob", to: "Alice") )
        XCTAssertTrue( e.connects(from: "Alice", to: "Bob") )
        XCTAssertFalse( e.connects(from: "Bob", to: "Rich") )
        
    }

}

