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
//  Edge.swift
//
//  Created by Rodney Dyer on 10/29/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import MapKit


class Edge: Identifiable, Codable {
    let id: UUID
    var fromNode: Node
    var toNode: Node
    var weight: Double
    
    init( fromNode: Node, toNode: Node, weight: Double ) {
        id = UUID()
        self.fromNode = fromNode
        self.toNode = toNode
        self.weight = weight
    }
    
    
    enum CodingKeys: Int, CodingKey {
        case id
        case fromNode
        case toNode
        case weight
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        id = try values.decode( UUID.self, forKey: .id )
        fromNode = try values.decode( Node.self, forKey: .fromNode )
        toNode = try values.decode( Node.self, forKey: .toNode )
        weight = try values.decode( Double.self, forKey: .weight )
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( id, forKey: .id )
        try container.encode( fromNode, forKey: .fromNode )
        try container.encode( toNode, forKey: .toNode )
        try container.encode( weight, forKey: .weight )
    }
}






extension Edge: CustomStringConvertible {
    var description: String {
        return String("\(fromNode.label) - \(toNode.label): \(self.weight)")
    }
}




// MARK: - Spatial Extensions for MKMapKit

extension Edge {
    
    var polyline: MKPolyline {
        let coords = [ fromNode.coordinate, toNode.coordinate]
        
        return MKPolyline(coordinates: coords, count: 2)
    }
    
}
