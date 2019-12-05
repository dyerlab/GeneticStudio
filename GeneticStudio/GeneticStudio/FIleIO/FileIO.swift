//
//  FileIO.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 5/24/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

/**
 Parse delimited file into [[String]] object.
 
 - Parameter path: String representing path to the file
 - Parameter delimiter: String object to separate columns from each row.
 
 - Returns: An array of string array objects.
 */
public func parseDelimitedFile(path: String, delimiter: String) -> [[String]]? {
    let url = URL(fileURLWithPath: path)
    let contents: String
    var lines = [String]()
    var data = [[String]]()
    
    do {
        contents = try String(contentsOf: url)
        lines = contents.components(separatedBy: "\n")
    } catch {
        print( error.localizedDescription )
    }
    
    data.reserveCapacity(lines.count)
    for line in lines {
        if line.contains(delimiter) {
            data.append( line.components(separatedBy: delimiter) )
        }
    }
    return data
}



/**
 Main entry point to input genotype file from csv.
 
 - Parameter path: The path to the file
 - Parameter format: An instance of the InputFileFormat that describes the contents of the file being imported.
 */
public func importGenotypeFile(path: String, format: InputFileFormat ) -> Population? {
    var data: Population?
    if path.isEmpty {
        return data
    }
    
    guard let contents = parseDelimitedFile(path: path, delimiter: ",") else { return nil }
    if contents.isEmpty {
        return data
    }
    
    data = Population()
    
    let header = contents[0]
    
    for i in 1 ..< contents.count  {
        let row = contents[i]
        
        if row.count == header.count {
            let ind = Individual()
            
            // Add the strata
            for j in 0 ..< format.numStrata {
                ind.strata[ header[j] ] = row[j]
            }
            
            // Add the coordinates
            var numCoords = 0
            if format.hasCoordinates {
                if let latIdx = header.firstIndex(of: "Latitude") {
                    numCoords += 1
                    let lat = Double( row[latIdx] )
                    if let lonIdx = header.firstIndex(of: "Longitude" ) {
                        numCoords += 1
                        let lon = Double( row[lonIdx] )
                        ind.location = Coordinate( longitude: lat!,
                                                   latitude: lon! )
                    }
                }
            }
            let locusStart = format.numStrata + numCoords + 1
            let locusEnd = locusStart + format.numLoci
            for j in  locusStart ..< locusEnd {
                let alleles = row[j].components(separatedBy: ":")
                if alleles.count > 0 {
                    ind.locus[ header[j] ] = Genotype( alleles: alleles )
                }
                else {
                    ind.locus[ header[j] ] = Genotype()
                }
            }
            print( ind.locus.keys )
            data?.append(individual: ind)
        }
    }
    
    return data
}


