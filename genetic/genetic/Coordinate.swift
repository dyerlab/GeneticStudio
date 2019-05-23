//
//  Coordinate.swift
//  genetic
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit

enum CoordinateError: Error {
    case CoordinateOutOfBounds
}


struct Coordinate: Codable, Hashable, Equatable    {
    var longitude: Double = 0.0
    var latitude: Double = 0.0
    var is_valid: Bool {
        get {
            return abs(longitude) <= 180.0 && abs(latitude) <= 90.0
        }
    }
    
}



extension Coordinate {
    init(_ coordinate: CLLocationCoordinate2D) {
        self = .init(longitude: coordinate.longitude, latitude: coordinate.latitude)
    }
}

extension CLLocationCoordinate2D {
    init(_ coordinate: Coordinate) {
        self = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}
