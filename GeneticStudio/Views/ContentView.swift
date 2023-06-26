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
                    SummaryView(notes: $document.notes )
                } label: {
                    Label("Summary", systemImage: "heart")
                }

                NavigationLink(destination: Text("Favorites")) { Label("Favorites", systemImage: "star") }
                
                Text("")
                
                NavigationLink(destination: MapView(locations: document.dataSet.locations)) { Label("Map", systemImage: "map.fill") }
                    .accentColor( .red )
                    .disabled( document.isEmpty )
                
                NavigationLink(destination: Text("Diversity")) { Label("Diversity", systemImage: "slider.horizontal.3") }
                    .accentColor( .orange )
                    .disabled( document.isEmpty )
                
                NavigationLink(destination: Text("Ordination")) { Label("Ordination", systemImage: "square.and.line.vertical.and.square.filled") }
                    .accentColor( .green )
                    .disabled( document.isEmpty )
                
                NavigationLink(destination: Text("Structure")) { Label("Structure", systemImage: "circle.grid.3x3.fill") }
                    .accentColor( .blue )
                    .disabled( document.isEmpty )
                
                NavigationLink(destination: Text("Popgraph")) { Label("Popgraph", systemImage: "perspective") }
                    .accentColor(.purple)
                    .disabled( document.isEmpty )
                
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
