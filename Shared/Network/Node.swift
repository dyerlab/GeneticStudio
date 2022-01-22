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
//  Node.swift
//
//  Created by Rodney Dyer on 10/29/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import CoreLocation
import MapKit

class Node: Identifiable, Codable {
    
    let id: UUID
    let label: String
    var subtitle: String
    let size: Double
    var coordinate: CLLocationCoordinate2D
    
    init(label: String = "bob", size: Double = 1.0, subtitle: String = "") {
        id = UUID()
        self.label = label
        self.size = size
        self.subtitle = subtitle
        coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        
    }
    
    
    enum CodingKeys: Int, CodingKey {
        case id
        case label
        case subtitle
        case size
        case latitude
        case longitude
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        id = try values.decode( UUID.self, forKey: .id )
        label = try values.decode( String.self, forKey: .label )
        subtitle = try values.decode( String.self, forKey: .subtitle )
        size = try values.decode( Double.self, forKey: .size )
        let lon = try values.decode( Double.self, forKey: .longitude )
        let lat = try values.decode( Double.self, forKey: .latitude )
        coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon )
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( id, forKey: .id )
        try container.encode( label, forKey: .label )
        try container.encode( description, forKey: .subtitle )
        try container.encode( size, forKey: .size )
        try container.encode( coordinate.longitude, forKey: .longitude )
        try container.encode( coordinate.latitude, forKey: .latitude )
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }
    
}



extension Node: CustomStringConvertible {
    var description: String {
        return String("\(self.label): \(self.size)  (\(self.coordinate.longitude), \(self.coordinate.latitude))  ")
    }
}




// MARK: - Spatial Operations for MKMapKit

extension Node {
    
    var pointAnnotation: MKPointAnnotation {
        let ret = MKPointAnnotation()
        ret.title = self.label
        ret.subtitle = self.subtitle
        ret.coordinate = self.coordinate
        return ret
    }
    
    var placeMarker: PlaceMarker {
        return PlaceMarker(name: self.label,
                           size: self.size,
                           coordinate: self.coordinate)
    }
    
   
}
