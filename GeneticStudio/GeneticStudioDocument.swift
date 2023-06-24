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
    var dataSet: DataSet
    var isEmpty: Bool {
        return dataSet.indiviudals.count == 0 
    }

    init(notes: String = "Hello, world!") {
        self.notes = notes
        self.dataSet = DataSet.defaultBajaData
    }

    static var readableContentTypes: [UTType] { [.gstudio] }

    init(configuration: ReadConfiguration) throws {
        guard let fileData = configuration.file.regularFileContents,
              let string = String(data: fileData, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        notes = string
        dataSet = DataSet.defaultBajaData
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let fileData = notes.data(using: .utf8)!
        return .init(regularFileWithContents: fileData)
    }
}




