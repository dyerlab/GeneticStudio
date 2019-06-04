//
//  OutlineViewItem.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 6/1/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit

class OutlineViewItem {
    var label: String
    var node: SCNNode?

    init( label: String, node: SCNNode? = nil ) {
        self.label = label
        self.node = node
    }
}
