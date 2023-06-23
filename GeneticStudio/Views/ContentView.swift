//
//  ContentView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/23/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: GeneticStudioDocument

    var body: some View {
        NavigationView {

            List {
                NavigationLink {
                    SummaryView(notes: document.notes )
                } label: {
                    Label("Summary", systemImage: "heart")
                }

                NavigationLink(destination: Text("Favorites")) { Label("Favorites", systemImage: "star") }
                
                Text("")
                
                NavigationLink(destination: Text("Map")) { Label("Map", systemImage: "map.fill") }
                    .accentColor( .red )
                NavigationLink(destination: Text("Diversity")) { Label("Diversity", systemImage: "slider.horizontal.3") }
                    .accentColor( .orange )
                NavigationLink(destination: Text("Ordination")) { Label("Ordination", systemImage: "square.and.line.vertical.and.square.filled") }
                    .accentColor( .green )
                NavigationLink(destination: Text("Structure")) { Label("Structure", systemImage: "circle.grid.3x3.fill") }
                    .accentColor( .blue )
                NavigationLink(destination: Text("Popgraph")) { Label("Popgraph", systemImage: "perspective") }
                    .accentColor(.purple)
                
            }
            .listStyle( SidebarListStyle() )
        
            GeneticStudioView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(GeneticStudioDocument()))
    }
}
