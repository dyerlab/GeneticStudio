//
//  Coordinate.swift
//  genetic
//
//  Created by Rodney Dyer on 5/23/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit

/// Error for Coordinate enum
public enum CoordinateError: Error {

    /// Coordiante out of bounds
    case coordinateOutOfBounds
}

/**
 Struct for a general coordinate that can be Codable and Equatable
 
 */
public struct Coordinate: Codable, Hashable, Equatable {

    // Longitude as decimal
    var longitude: Double = 0.0

    // Latitude as decimal
    var latitude: Double = 0.0

    /**
    Quick check on valididy of range for latitude & longitude.
 
    - Returns: Flag based upon lat/lon in proper range.
     */
    var isValid: Bool {
        return abs(longitude) <= 180.0 && abs(latitude) <= 90.0
    }

}

// MARK: -
extension Coordinate {

    // Override init for CLLocationCoordiante2D
    init(_ coordinate: CLLocationCoordinate2D) {
        self = .init(longitude: coordinate.longitude, latitude: coordinate.latitude)
    }
}

// MARK: -
extension CLLocationCoordinate2D {

    // Overload init for CLLocationCoordiante2D
    init(_ coordinate: Coordinate) {
        self = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}
