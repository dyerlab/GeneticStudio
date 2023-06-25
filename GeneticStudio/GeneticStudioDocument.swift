//
//  GeneticStudioDocument.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/23/23.
//

import SwiftUI
import DLGenetic
import UniformTypeIdentifiers

struct GeneticStudioDocument: FileDocument {
    var notes: String
    var dataSet: DataStore
    var isEmpty: Bool {
        return dataSet.isEmpty
    }

    init(notes: String = "Default note from init(notes:)") {
        self.notes = notes
        self.dataSet = DataStore.Default()
    }

    static var readableContentTypes: [UTType] { [.gstudio] }

    init(configuration: ReadConfiguration) throws {
        guard let fileData = configuration.file.regularFileContents,
              let string = String(data: fileData, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        notes = string
        dataSet = DataStore.Default()
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let fileData = notes.data(using: .utf8)!
        return .init(regularFileWithContents: fileData)
    }
}




