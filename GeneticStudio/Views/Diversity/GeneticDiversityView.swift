//
//  GeneticDiversityView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/2/23.
//

import SwiftUI
import DLGenetic

struct GeneticDiversityView: View {
    @State var diversity: [GeneticDiversity]
    @State private var selected = Set<GeneticDiversity.ID>()
    @State private var sortOrder = [KeyPathComparator(\GeneticDiversity.locus)]
    
    var body: some View {
        Table(diversity) {
            TableColumn("Locus", value: \.locus)
            TableColumn("N") { model in Text("\(model.N)") }
            TableColumn("A") { model in Text("\(model.A)") }
            TableColumn("A95") { model in Text("\(model.A95)") }
            TableColumn("Ae") { model in Text("\(model.Ae)") }
            TableColumn("Ho") { model in Text("\(model.Ho)") }
            TableColumn("He") { model in Text("\(model.He)") }
            TableColumn("F") { model in Text("\(model.F)") }            
        }
    }
}

#Preview {
    GeneticDiversityView(diversity: Frequencies.Default.locusDiversities )
}
