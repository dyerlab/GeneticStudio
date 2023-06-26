//
//  AnnotationView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/26/23.
//

import MapKit
import SwiftUI

struct AnnotationView: View {
    var annotation: LocationAnnotation?
    
    var body: some View {
        VStack(alignment: .leading ) {
            Text("\(annotation?.title ?? "title")")
            Text("\(annotation?.subtitle ?? "subtitle")")
                .font(.footnote)
        }
    }
}

#Preview {
    AnnotationView( annotation: LocationAnnotation(title: "The title",
                                                   subtitle: "The subtitle",
                                                   coordinate: CLLocationCoordinate2DMake(36.7, -77.3)))
}
