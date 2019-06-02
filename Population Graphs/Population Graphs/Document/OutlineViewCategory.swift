//
//  OutlineViewCategory.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 6/1/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation


class OutlineViewCategory {
    var label: String
    var items: [OutlineViewItem]
    
    init( label: String ) {
        self.label = label
        self.items = [OutlineViewItem]()
    }
}
