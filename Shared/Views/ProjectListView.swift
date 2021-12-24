//
//  SwiftUIView.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 12/24/21.
//

import SwiftUI

struct ProjectListView: View {
    
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
                .font( .title )
                .italic()
            
            Text("\(date, formatter: itemFormatter)")
                .font( .footnote )
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView( species: "Cornus florida",
                         date: Date() )
    }
}
