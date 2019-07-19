//
//  NodeTest.swift
//  DLabPopgraphKitTests
//
//  Created by Rodney Dyer on 7/19/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest
import SceneKit

class NodeTest: XCTestCase {

    func testNode() {
        
        let node = Node(label: "The Node", size: 2.3)
        
        XCTAssertFalse( node.selected )
        XCTAssertEqual( node.edges.count, 0 )
        XCTAssertEqual( node.description, "Node: The Node sz=2.3\n")
        

    }



}
