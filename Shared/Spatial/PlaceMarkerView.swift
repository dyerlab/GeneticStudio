//
//  NodeMapAnnotation.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 11/26/21.
//

import Foundation
import MapKit
import SwiftUI

class PlaceMarkerView: MKAnnotationView {
    

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        let  img = NSImage(systemSymbolName: "smallcircle.circle.fill", accessibilityDescription: "location symbol")
        self.image = img
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
