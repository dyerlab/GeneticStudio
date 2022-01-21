//
//  HorizontalVectorBar.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/21/22.
//

import SwiftUI

struct HorizontalVectorBar: View {
    var labels: [String]
    var values: Vector
    
    var body: some View {
        GeometryReader { gp in
                    
                    HStack(alignment: .center, spacing: 0) {
                        
                        ForEach( labels.indices, id: \.self) { index in
                            Text("\(labels[index])")
                                .frame( width: CGFloat(gp.size.width * values[index]) ,
                                        height: 50,
                                        alignment: .center
                                )
                                .background( Color.getSpacedColor(index: index,
                                                                  of: values.count,
                                                                  saturation: 0.95,
                                                                  brightness: 0.9))
                        }
                        
                    }
                    .frame( maxWidth: .infinity)
                    
                }
                .frame(height: 50)
    }
}

struct HorizontalVectorBar_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalVectorBar(labels: ["A","B","C","D"],
                            values: [0.45, 0.22, 0.03, 0.30] )
    }
}
