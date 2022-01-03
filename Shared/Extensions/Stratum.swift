//
//  Stratum.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 1/3/22.
//

import Foundation
import SwiftUI
import DLabGenetic
import CoreLocation

extension Stratum {
        
    static func loadCSV( data: Data ) -> Stratum? {
        
        guard let raw = String( data: data, encoding: .utf8) else { return nil }
        let lines = raw.components(separatedBy: "\n").map { $0.trimmingCharacters(in: CharacterSet.newlines).components(separatedBy: ",") }
        
        if lines.count < 2 {
            return nil
        }
        let N = lines.count
        let K = lines[0].count
        
        let header = lines[0].map{ $0.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) }
        
        // Check for longitude or latitude
        if let idxLon = header.firstIndex(where: {$0 == "Longitude"} ),
           let idxLat = header.firstIndex(where: {$0 == "Latitude"} ) {
        
            let mn = min( idxLat, idxLon )
            let mx = max( idxLat, idxLon )
            
            let data = Stratum(label: "All")
            
            var levels = [String]()
            for i in 0 ..< mn {
                levels.append( header[i] )
            }
            
            for i in 1 ..< N {
                let ind = Individual()
                
                if let lat = Double( lines[i][idxLat] ),
                   let lon = Double( lines[i][idxLon] ) {
                    ind.location = CLLocationCoordinate2D( latitude: lat,
                                                           longitude: lon )
                }
                
                var strata: [String] = []
                for s in 0 ..< mn {
                    strata.append( lines[i][s])
                }
                
                for l in mx ..< K {
                    let key = header[l]
                    ind.loci[key] = Locus(raw: lines[i][l] )
                }
                
                data.addIndividual(individual: ind, strata: strata, levels: levels)

            }

            
            print("Imported: \n \(data) ")
            
            return data
        }
        
        
        print("no data imported")
        
        
        return nil
        
    }
    
}


