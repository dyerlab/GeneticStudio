//
//  Document.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 6/17/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import UIKit
import DLGenetic

class Document: UIDocument {
    
    var theData : DataSet = {
        let data = DataSet()
        guard let path = Bundle(identifier: "com.dyerlab.DLCommon")?.path(forResource: "arapat", ofType: "csv") else { return data }
        let config = InputFileFormat( strata: 3, loci: 8, coords: true )
        if let pop = importGenotypeFile(path: path, format: config) {
            data.population = pop
        }
        return data
        }()
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        
        
        
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

