//
//  SpeciesView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/9/22.
//

import SwiftUI

struct SpeciesView: View {
    var image: UIImage
    var species: String
    
    var body: some View {
        VStack {
            Image(nsImage: image)
                .resizable()
                .frame(width:100, height:100)
                .clipShape( Circle() )
                .overlay( Circle().stroke(.secondary, lineWidth: 2.5))
                .shadow(radius: 7)
            Text( "\(species)")
                .italic()
                .font( .title2 )
        }
        .padding()
    }
}

struct SpeciesView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesView(image: UIImage(named: "Arapat")!,
                    species: "Araptus attenuata")
    }
}
