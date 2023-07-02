//
//  SwiftUIView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack(spacing: 0){
                        Text("Genetic")
                        Text("Studio")
                            .bold()
                            .foregroundStyle(.orange)
                    }
                    .font(.largeTitle)
                    HStack(spacing: 0) {
                        Text("Population genetic software ")
                        Text("doesn't")
                            .bold()
                        Text(" suck.")
                    }
                    .font( .caption2 )
                    Text("https://geneticstudio.app")
                        .font( .footnote )
                    
                }
                ZStack {
                    Image(systemName: "wrench.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x:10)
                        .opacity(0.8)
                    Image("PipetteDark")
                        .resizable()
                        .rotation3DEffect( Angle(degrees: 180.0),
                                           axis: (0,1,0) )
                        .frame(width: 50, height: 50)
                }
            }
        }
        .frame(maxWidth:   .infinity, maxHeight: .infinity)
    }
}

#Preview {
    TitleView()
}
