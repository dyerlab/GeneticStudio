//
//  AllelicDiversityView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/4/23.
//

import SwiftUI
import DLGenetic

struct AllelicDiversityView: View {
    var diversity: [GeneticDiversity]
    
    var body: some View {
        Table(diversity) {
            TableColumn("Locus", value: \.locus)
            TableColumn("N") { model in Text("\(model.N)") }
            TableColumn("A") { model in Text("\(model.A)") }
            TableColumn("A95") { model in Text("\(model.A95)") }
            TableColumn("Ae") { model in Text("\(model.Ae)") }
        }
    }
}

#Preview {
    AllelicDiversityView(diversity: DataStore.Default().frequencies.locusDiversities )
}
