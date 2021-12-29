//
//  GeneticStudioView.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 12/26/21.
//

import SwiftUI

struct GeneticStudioView: View {
    var body: some View {
        
        VStack(alignment: .center) {
            Spacer()
            HStack(alignment:.center) {
                Spacer()
                
                HStack {
                    
                    VStack{
                        
                        
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
                            Text("Genetic")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor( .gstudioAccentOne )
                            Text("Studio")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor( .gstudioAccentTwo )

                        }
                        
                        Text("Population Genetic Software That Doesn't Suck")
                            .font(.subheadline)
                            .foregroundColor( Color.secondary )
                        Text("&copy; 2022 RJ Dyer")
                            .padding(20)
                            .font(.caption )
                            .foregroundColor( Color.secondary )
                    }

                    Image( nsImage: NSImage(named: "Dyerlab")! )
                        .resizable()
                        .frame(width: 324/2, height:476/2)
                        .clipShape( RoundedRectangle(cornerRadius: 5.0))
                        .shadow(radius: 5.0)

                }
                Spacer()
            }
            Spacer()
        }
        .frame(minWidth:500)
        
    }
}

struct GeneticStudioView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeneticStudioView()
            .preferredColorScheme( .dark )
        
        GeneticStudioView()
            .preferredColorScheme( .light )
    }
}
