//
//  SummaryView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/23/23.
//

import SwiftUI

struct SummaryView: View {
    @Binding var notes: String
    
    var body: some View {
        
        VStack {
            Text("Summary")
                .font(.largeTitle)
            
            Text("\(notes)")
                .font(.headline)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SummaryView( notes: .constant("These are my notes") )
}
