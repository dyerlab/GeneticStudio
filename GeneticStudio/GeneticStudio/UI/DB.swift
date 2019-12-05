//
//  DB.swift
//  Geno
//
//  Created by Rodney Dyer on 7/7/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa

public class DB {
    
    public static let `default` = DB()
    
    public var container: NSPersistentContainer!
    
    /// Call this once in `applicationDidFinishLaunching`
    public func setup(dataModelName: String) {
        container = NSPersistentContainer(name: dataModelName)
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }
    
}
