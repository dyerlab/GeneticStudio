//
//  SummaryView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/23/23.
//

import SwiftUI

struct SummaryView: View {
    var notes: String
    
    var body: some View {
        
        VStack {
            Text("Summary")
                .font(.largeTitle)
            
            Text("\(notes)")
                .font(.headline)
            Spacer()
        }
    }
}

#Preview {
    SummaryView( notes: "notes" )
}
