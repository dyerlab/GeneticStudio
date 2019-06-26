//
//  Document.swift
//  Geno
//
//  Created by Rodney Dyer on 6/26/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SwiftUI

class Document: NSPersistentDocument {

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Use NSHostingView for window content view.
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()

        window.contentView = NSHostingView(rootView: ContentView())

        let windowController = NSWindowController(window: window)
        self.addWindowController(windowController)
    }

}
