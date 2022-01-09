//
//  Project.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/9/22.
//

import Foundation
import AppKit
import SwiftUI

extension Project {
    
    var nsImage: NSImage? {
        get {
            guard let data = self.imageData else { return nil }
            return NSImage( data: data )
        }
        set {
            self.imageData = newValue?.PNGRepresentation()
        }
    }
    
    
}
