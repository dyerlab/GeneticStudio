//
//  GeneticStudioHomeView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/23/23.
//

import SwiftUI

struct GeneticStudioView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("GeneticStudio")
                        .font(.largeTitle)
                    Text("Population genetic software that doesn't suck.")
                        .font( .caption2 )
                    Text("https://geneticstudio.app")
                        .font( .footnote )
                    
                }
                ZStack {
                    Image(systemName: "hammer")
                        .resizable()
                        .rotation3DEffect( Angle(degrees: 180.0),
                                           axis: (0,1,0) )
                        .frame(width: 50, height: 50)
                        .offset(x:-10)
                    Image(systemName: "wrench.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x:10)
                }

            }
        }

    }
}

#Preview {
    GeneticStudioView()
}
