//
//  ContentView.swift
//  Shared
//
//  Created by Rodney Dyer on 12/24/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        ProjectListView()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
