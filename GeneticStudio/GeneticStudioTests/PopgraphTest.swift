//
//  PopgraphTest.swift
//  DLabPopgraphKitTests
//
//  Created by Rodney Dyer on 7/19/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class PopgraphTest: XCTestCase {



    func testPopgraph() {
        let graph = Popgraph()
        
        graph.addNode( label: "Bob", size: 23.3 )
        graph.addNode( label: "Alice", size: 12.3 )
        graph.addEdge(from: "Bob", to: "Alice", weight: 23, symmetric: true )
        
        XCTAssertEqual( graph.edges.count, 2 )
        XCTAssertEqual( graph.nodes.count, 2 )
        
        graph.addNode( label: "Bill", size: 12.3  )
        graph.addEdge(from: "Bob", to: "Bill", weight: 12, symmetric: false )
        
        XCTAssertEqual( graph.edges.count, 3 )
        XCTAssertEqual( graph.nodes.count, 3 )

    }

    
    func testDefaultPopgraph() {
        let graph = defaultGraph()
     
        XCTAssertEqual( graph.nodes.count, 29 )
        XCTAssertEqual( graph.edges.count, 152 )
        
        let m = graph.asMatrix()
        XCTAssertEqual( m.rows, 29 )
        XCTAssertEqual( m.cols, 29 )
        XCTAssertEqual( m.sum(), 152.0 )
        
        print("\(graph)")
        
    }
    

    
    
}
