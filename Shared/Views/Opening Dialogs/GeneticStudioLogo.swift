//
//  GeneticStudioLogo.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 12/30/21.
//

import SwiftUI

struct GeneticStudioLogo: View {
    var body: some View {
        
        VStack {
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
                    .foregroundColor( .gstudioAccentOne  )
            }
            
            HStack(spacing: 0 ){
                Text("Welcome to ")
                    .font(.largeTitle)
                    .bold()
                    
                LinearGradient(gradient: Gradient( colors: [ .indigo, .pink]),
                               startPoint: .leading,
                               endPoint: .trailing)
                    .mask( VStack(alignment: .leading) {
                        Text("GeneticStudio")
                            .font(.largeTitle)
                        .bold() }
                    )
                    .frame(height: 20 )
                    .padding(0)
                    
            }
            
            Text("Population Genetic Software That Doesn't Suck")
                .font(.subheadline)
                .foregroundColor( Color.secondary )
            
            Text("&copy; 2022 RJ Dyer")
                .font(.caption )
                .foregroundColor( Color.secondary )
        }
        .frame(width: 325)
        .padding()
        
    }
}

struct GeneticStudioLogo_Previews: PreviewProvider {
    static var previews: some View {
        GeneticStudioLogo()
    }
}
