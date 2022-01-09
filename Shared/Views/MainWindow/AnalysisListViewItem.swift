//
//  AnalysisListViewItem.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 12/26/21.
//

import SwiftUI

struct AnalysisListViewItem: View {
    var title: String
    var subtitle: String
    var image: String
    
    var body: some View {
        HStack(alignment: .center ) {
            Image(systemName: image)
                .font(.system(size: 24.0, weight: .bold ) )
            VStack( alignment: .leading ) {
                Text( title )
                    .font(.title3)
                Text( subtitle)
                    .font(.subheadline)
            }
        }
    }
}

struct AnalysisListViewItem_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisListViewItem(title: "Genotypes",
                             subtitle: "View & Edit",
                             image: "square.grid.3x3.square" )
    }
}
