//
//  SidebarView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import SwiftUI

struct SidebarView: View {
    @Binding var document: GeneticStudioDocument
    
    var body: some View {
        List {
            Section {
                NavigationLink {
                    SummaryView(document: $document )
                } label: {
                    Label("Summary", systemImage: "heart")
                }
                
                NavigationLink(destination: Text("Favorites")) { Label("Favorites", systemImage: "star") }
                
            }
            
            Section {
                
                NavigationLink(destination: MapsPage(dataStore: $document.dataStore)) {
                    Label( "Maps",
                           systemImage: "map.fill")
                    .foregroundColor( .red )
                }
                .disabled( document.isEmpty )
                
                NavigationLink(destination: DiversityPage(dataStore: $document.dataStore) ) {
                    Label("Diversity", systemImage: "slider.horizontal.3")
                        .foregroundColor( .orange )
                        
                }
                .disabled( document.isEmpty )
                
                NavigationLink(destination: Text("Ordination")) { Label("Ordination", systemImage: "square.and.line.vertical.and.square.filled")
                    .foregroundColor( .green )}
                    .disabled( document.isEmpty )
                
                NavigationLink(destination: Text("Structure")) { Label("Structure", systemImage: "circle.grid.3x3.fill")
                    .foregroundColor(.blue )}
                    .disabled( document.isEmpty )
                
                NavigationLink(destination: Text("Popgraph")) { Label("Popgraph", systemImage: "perspective").foregroundColor(.purple) }
                    .disabled( document.isEmpty )
                
            }
            
        }
        .listStyle( SidebarListStyle() )
        .frame(minWidth: 200, idealWidth: 210, maxWidth: 220)
    }
}

#Preview {
    SidebarView(document: .constant( GeneticStudioDocument() ) )
}
