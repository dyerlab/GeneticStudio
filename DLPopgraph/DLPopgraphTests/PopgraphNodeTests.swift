//
//  NodeTest.swift
//  PopgenKitTests
//
//  Created by Rodney Dyer on 6/14/19.
//

import XCTest

class PopgraphNodeTest: XCTestCase {

    func testInitPopagraphNode() {
        let node = PopgraphNode(label: "bob", size: 2.0 )
        
        XCTAssertEqual( node.label, "bob")
        XCTAssertEqual( node.size, 2.0 )
        XCTAssertEqual( node.edges.count , 0 )
        
    }
}
