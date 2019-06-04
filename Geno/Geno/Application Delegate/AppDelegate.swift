//
//  AppDelegate.swift
//  Geno
//
//  Created by Rodney Dyer on 6/4/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import Foundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    // MARK: - Properties
    var window: NSWindow?

    private let coreDataManager = CoreDataManager(modelName: "DataSet")
    
    // MARK: -
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let coreDataManager = CoreDataManager(modelName: "DataSet")
        print( coreDataManager.managedObjectContext )
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

