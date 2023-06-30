//
//  GeneticStudioDocument.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/30/23.
//

import SwiftUI
import DLGenetic
import UniformTypeIdentifiers

struct GeneticStudioDocument: FileDocument {
    var dataStore: DataStore
    var species: String
    
    var isEmpty: Bool {
        return dataStore.isEmpty
    }

    init(species: String = "Araptus attenuatus") {
        self.species = species
        self.dataStore = DataStore.Default()
    }

    static var readableContentTypes: [UTType] { [.gstudio] }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        species = string
        self.dataStore = DataStore.Default()
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = species.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}


