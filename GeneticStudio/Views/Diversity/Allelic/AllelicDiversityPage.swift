//
//  AllelicDiversityPage.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/4/23.
//

import SwiftUI
import DLGenetic

struct AllelicDiversityPage: View {
    var level: String
    var dataStore: DataStore
    
    var body: some View {
        VStack {
            Text("Allelic Diversity for \(level)")
                .font( .title )
            AllelicDiversityView( diversity: dataStore.frequencies.locusDiversities)
            Spacer()
        }

    }
}

#Preview {
    AllelicDiversityPage( level: "All",
                          dataStore: DataStore.Default() )
}
