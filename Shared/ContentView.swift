//
//  ContentView.swift
//  Shared
//
//  Created by Rodney Dyer on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: GeneticStudioDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(GeneticStudioDocument()))
    }
}
