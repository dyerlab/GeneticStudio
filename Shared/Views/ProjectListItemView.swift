//
//  SwiftUIView.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 12/24/21.
//

import SwiftUI

struct ProjectListItemView: View {
    
    var species: String
    var date: Date
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text( species )
                .font( .headline )
                .italic()
            
            Text("\(date, formatter: itemFormatter)")
                .font( .footnote )
        }
        .frame(minWidth:200, alignment: .leading)
        .padding(5)
    }
}

struct ProjectListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListItemView( species: "Cornus florida",
                         date: Date() )
    }
}
