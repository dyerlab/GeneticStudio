//
//  PopgraphEdgeTests.swift
//  PopgenKitTests
//
//  Created by Rodney Dyer on 6/14/19.
//

import XCTest

class PopgraphEdgeTests: XCTestCase {

    func testPopgraphEdge() {

        let source = PopgraphNode(label: "source", size: 2.0)
        let destination = PopgraphNode( label: "destination", size: 4.0 )
        let edge = PopgraphEdge(from: source, to: destination, weight: 8.9)
        
        XCTAssertEqual( edge.weight, 8.9 )
        XCTAssertTrue( edge.connects(from: "source", to: "destination") )
        XCTAssertTrue( edge.connects(from: "destination", to: "source") )
        XCTAssertFalse( edge.connects(from: "infinity", to: "beyond") )
        
    }

}
