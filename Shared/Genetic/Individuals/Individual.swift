//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
// 
//  GeneticStudio
//  Individual.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import CoreLocation

public class Individual: Identifiable, Codable, Hashable, Equatable {
    
    public var id: UUID
    public var location: CLLocationCoordinate2D?
    public var loci = [String:Locus]()
    
    enum CodingKeys: String, CodingKey {
        case id
        case latitude
        case longitude
        case strata
        case loci
    }
    
    public init() {
        self.id = UUID()
    }
    
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        id = try values.decode( UUID.self , forKey: .id )
        loci = try values.decode( Dictionary.self, forKey:  .loci )
        let lon = try values.decode( Double.self, forKey: .longitude )
        let lat = try values.decode( Double.self, forKey: .latitude )
        self.location = CLLocationCoordinate2DMake(lat, lon)
    
    }
    
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( id, forKey: .id )
        try container.encode( loci, forKey: .loci )
        if let coord = self.location {
            try container.encode( coord.latitude, forKey: .latitude )
            try container.encode( coord.longitude, forKey: .longitude )
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine( self.id )
    }
    
    
    public static func == (lhs: Individual, rhs: Individual) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}






extension Individual: CustomStringConvertible {
    
    /// Overload for printing
    public var description: String {
        
        var ret = ""
        
        if let coord = self.location {
            ret += String("\(coord.longitude) \(coord.latitude) ")
        }
        
        for key in loci.keys.sorted() {
            ret += String( "\(loci[key, default: Locus()]) ")
        }
        
        return ret
    }
}



