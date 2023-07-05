//
//  MultiMapCardView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 7/2/23.
//

import MapKit
import SwiftUI
import DLGenetic

struct MultiMapCardView: View {
    var strata: String
    var levels: [String]
    var locations: [String: [Location] ]
    @State var currentMap: Int = 0
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill( .background )
                .shadow(radius: 4.0)
            VStack {
                HStack {
                    Button(action: {
                        currentMap = currentMap != 0 ? currentMap - 1 : levels.count - 1
                    }, label: {
                        Image( systemName: "arrow.backward")
                            .foregroundColor( .red )
                    })
                    .buttonStyle( .bordered )
                                      
                    Button(action: {
                        currentMap = currentMap < (levels.count-1) ? currentMap + 1 : 0
                    }, label: {
                        Image( systemName: "arrow.forward")
                            .foregroundColor( .red )
                    })
                    .buttonStyle( .bordered )
                    
                    
                    HStack{
                        Image(systemName: "map.fill")
                        Text("\(strata): \(levels[ currentMap ])")
                    }
                    .font( .title2 )
                    .foregroundColor(.red)
                    
                    Spacer()
                    
                }
                .padding([.leading, .top, .trailing])
                Spacer()
                MapView(locations: locations[ levels[currentMap], default: [Location]()])
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
        .padding()

    }
}

#Preview {
    MultiMapCardView(strata: "Region",
                     levels: DataStore.Default().individuals.strataLevels(within: "Region"),
                     locations: DataStore.Default().strataLocations(strata: "Region") )
}
