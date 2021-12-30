//
//  GeneticStudioDocument.swift
//  Shared
//
//  Created by Rodney Dyer on 12/29/21.
//

import SwiftUI
import UniformTypeIdentifiers



/// Main document type for gstudio data
struct GeneticStudioDocument: FileDocument, Codable  {
    
    /// Project object contains all the content
    var project: Project = Project(species: "Cornus florida")

    /// Static init
    init() {}

    /// Readable types for import and load/save
    static var readableContentTypes: [UTType] { [.gstudioDocument, .commaSeparatedText] }

    /**
     Initializer for reading in .gstudio  and .csv types.
     */
    init(configuration: ReadConfiguration) throws {
        
        guard let data = configuration.file.regularFileContents else { throw CocoaError(.fileReadCorruptFile) }
        
        if configuration.contentType == .gstudioDocument {
            self.project = try JSONDecoder().decode( Project.self, from: data )
        }
        else if configuration.contentType == .commaSeparatedText {
            print("CSV not configured yet")
            throw CocoaError( .featureUnsupported )
        }
        else {
            print( "\(configuration.contentType) not implemented.")
            throw CocoaError( .fileReadUnsupportedScheme )
        }
    }
    
    /**
     Called to save types
     */
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try JSONEncoder().encode( self.project )
        return .init(regularFileWithContents: data )
    }
    
    
    

}
