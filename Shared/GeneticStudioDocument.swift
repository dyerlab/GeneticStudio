//
//  GeneticStudioDocument.swift
//  Shared
//
//  Created by Rodney Dyer on 12/29/21.
//

import SwiftUI
import DLabGenetic
import UniformTypeIdentifiers



/// Main document type for gstudio data
struct GeneticStudioDocument: FileDocument, Codable  {
    
    /// Project object contains all the content
    var image: NSImage
    
    /// The name of the species
    var species: String
    
    /// The stratum
    var strata: Stratum

    /// Readable types for import and load/save
    static var readableContentTypes: [UTType] {
        return [ .gstudioDocument ]
    }

    /// Coding
    enum CodingKeys: String, CodingKey {
        case species
        case strata
        case imageData
    }
    
    
    /// Static init
    init() {
        self.species = "Araptus attenuata"
        self.strata = Stratum.DefaultStratum()
        self.image = NSImage(named: "Arapat")!
    }
    
    
    /// Required initializer
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        self.species = try values.decode( String.self, forKey: .species )
        self.strata = try values.decode( Stratum.self, forKey: .strata )
        let data = try values.decode( Data.self, forKey: .imageData )
        self.image = NSImage(data: data ) ?? NSImage(named: "Tree")!
    }

    /// Required encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( self.species, forKey: .species )
        try container.encode( self.strata, forKey: .strata )
        try container.encode( self.image.PNGRepresentation(), forKey: .imageData )
    }
    

    /**
     Initializer for reading in .gstudio  and .csv types.
     */
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents else { throw CocoaError(.fileReadCorruptFile) }
        
        self = try JSONDecoder().decode( GeneticStudioDocument.self, from: data )

        /*
        if configuration.contentType == .gstudioDocument {
            self.project = try JSONDecoder().decode( Project.self, from: data )
        }
        else if configuration.contentType == .commaSeparatedText {
            
            self.species = ""
            self.strata = Stratum(label: "All", level: "Root")
            self.strata.loadFromCSV(data: data )
        }
        else {
            print( "\(configuration.contentType) not implemented.")
            throw CocoaError( .fileReadUnsupportedScheme )

        }
         */
    }
    
    /**
     Called to save types
     */
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try JSONEncoder().encode( self )
        return .init(regularFileWithContents: data )
    }
    

}



extension GeneticStudioDocument {
    
    static func DefaultDocument() -> GeneticStudioDocument {
        
        var ret = GeneticStudioDocument()
        
        ret.strata = Stratum.DefaultStratum()
        ret.species = "Araptus attenuatus"
        ret.image = NSImage(named: "Arapat")!
        
        return ret
    }
    
}
