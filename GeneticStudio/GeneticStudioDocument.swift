//
//  GeneticStudioDocument.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/23/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct GeneticStudioDocument: FileDocument {
    var notes: String
    var dataStore: DataStore

    init(notes: String = "Hello, world!") {
        self.notes = notes
        self.dataStore = DataStore()
    }

    static var readableContentTypes: [UTType] { [.gstudio] }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        notes = string
        dataStore = DataStore()
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = notes.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}




