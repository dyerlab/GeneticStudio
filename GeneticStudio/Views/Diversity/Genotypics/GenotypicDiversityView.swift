//
//  GenotypicDiversityView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/4/23.
//

import SwiftUI
import DLGenetic

struct GenotypicDiversityView: View {
    var diversity: [GeneticDiversity]
    
    var body: some View {
        Table(diversity) {
            TableColumn("Locus", value: \.label)
            TableColumn("N") { model in Text("\(model.N)") }
            TableColumn("Ho") { model in Text("\(model.Ho)") }
            TableColumn("He") { model in Text("\(model.He)") }
            TableColumn("F") { model in Text("\(model.F)") }
        }
    }
}

#Preview {
    GenotypicDiversityView(diversity: DataStore.Default().diversityForAllLoci() )
}
