//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  GeneticStudio
//  NSImage.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Cocoa
import Foundation
import AppKit

typealias UIImage = NSImage

extension NSImage {
    
    
    var cgImage: CGImage? {
        var proposedRect = CGRect(origin: .zero, size: size)

        return cgImage(forProposedRect: &proposedRect,
                       context: nil,
                       hints: nil)
    }

    
    public func PNGRepresentation() -> Data? {
        guard let cgImage = self.cgImage( forProposedRect: nil,
                                          context: nil,
                                          hints: nil)
            else { return nil }
        let imageRep = NSBitmapImageRep(cgImage: cgImage)
        imageRep.size = self.size
        return imageRep.representation( using: .png,
                                        properties: [:] )
    }
    
}
