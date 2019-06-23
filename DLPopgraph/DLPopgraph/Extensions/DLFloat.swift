//
//  DLFloat.swift
//  DLPopgraph
//
//  Created by Rodney Dyer on 6/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation


#if os(macOS)
public typealias DLFloat = CGFloat
#else
public typealias DLFloat = Float
#endif
