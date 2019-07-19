//
//  DLColor.swift
//  DLabPopgraphKit
//
//  Created by Rodney Dyer on 7/8/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//


#if os(macOS)
import AppKit
public typealias DLColor = NSColor
#else
import UIKit
public typealias DLColor = UIColor
#endif
