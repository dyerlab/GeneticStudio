//
//  ItemCardView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import DLGenetic
import SwiftUI
import MapKit

struct MapCardView: View {
    var title: String
    var locations: [Location]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill( .background )
                .shadow(radius: 4.0)
            VStack {
                HStack(alignment: .center) {

                    HStack{
                        Image(systemName: "map.fill")
                        Text("\(title)")
                    }
                    .font( .title2 )
                    .foregroundColor(.red)

                    Spacer()
                }
                .padding([.leading, .top, .trailing])
                Spacer()
                MapView(locations: locations)
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 25,
                        bottomTrailingRadius: 25,
                        topTrailingRadius: 0
                    )
                )
                .frame( minHeight: 300)
            }
        }
        
        
        
    }
}

#Preview {
    MapCardView( title: "Item Title",
                 locations: DataStore.Default().individualsAtLevel( stratum: "Population",
                                                                    level: "9").locations )
}
