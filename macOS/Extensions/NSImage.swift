//
//  NSImage.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/9/22.
//

import Foundation
import AppKit

extension NSImage {
    
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
