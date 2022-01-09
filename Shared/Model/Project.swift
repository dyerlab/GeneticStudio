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
//  Project.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//


import Foundation
import DLabGenetic
import SwiftUI


class Project: Codable {

    var data: Stratum
    var species: String
    var imageData: Data?
        
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    enum CodingKeys: String, CodingKey {
        case species
        case data
        case imageData
    }
    
    init(species: String) {
        self.species = species
        self.data = Stratum(label: "All")
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        self.species = try values.decode( String.self, forKey: .species )
        self.data = try values.decode( Stratum.self, forKey: .data )
        self.imageData = try values.decode( Data.self, forKey: .imageData )
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( self.species, forKey: .species )
        try container.encode( self.data, forKey: .data )
        try container.encode( self.imageData, forKey: .imageData )
    }
}



extension Project {
    
    static func DefaultProject() -> Project {
        let ret = Project(species: "Araptus attenuata")
        ret.data = Stratum.DefaultStratum()
        return ret
    }
}
