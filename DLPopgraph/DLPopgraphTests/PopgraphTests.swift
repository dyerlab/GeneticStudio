//
//  PopgraphTests.swift
//  PopgenKitTests
//
//  Created by Rodney Dyer on 6/14/19.
//

import XCTest

class PopgraphTests: XCTestCase {

    func testPopgraph() {
        
        let G = Popgraph()
        
        XCTAssertEqual( G.nodes.count, 0)
        XCTAssertEqual( G.edges.count, 0)
        
        G.addNode(label: "Bob", size: 1.0)
        G.addNode(label: "Alice", size: 2.0)
        XCTAssertEqual( G.nodes.count, 2)
        
        G.addEdge(from: "Bob", to: "Alice", weight: 4.3, symmetric: true )
        print(G)
        XCTAssertEqual( G.edges.count, 2 )
        XCTAssertEqual( G.edges.first!.weight, 4.3 )
        
        G.addNode( label: "Felix", size: 3.0)
        G.addEdge(from: "Alice", to: "Felix", weight: 3.4, symmetric: false )
        
        XCTAssertEqual( G.edges.count, 3 )
        
        
    }
    
}
