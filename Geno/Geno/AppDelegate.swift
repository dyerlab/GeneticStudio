//
//  AppDelegate.swift
//  Geno
//
//  Created by Rodney Dyer on 7/7/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        DB.default.setup(dataModelName: "Document")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

