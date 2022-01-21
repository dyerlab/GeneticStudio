//
//  PieSliceText.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 2/15/21.
//

import SwiftUI

struct PieSliceText: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
            Text(description)
                .font(.title)
        }
    }
}

struct PieSliceText_Previews: PreviewProvider {
    static var previews: some View {
        PieSliceText(title: "The Title", description: "Description")
    }
}
