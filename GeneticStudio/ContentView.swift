//
//  ContentView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: GeneticStudioDocument

    var body: some View {
        
        NavigationView {
            SidebarView(document: $document )
                .navigationSplitViewColumnWidth(min: 100, ideal: 200, max: 300)
            TitleView()
                .navigationSplitViewColumnWidth(min: 100, ideal: 200, max: 300)

        }
        
    }
}

#Preview {
    ContentView(document: .constant(GeneticStudioDocument()))
}
