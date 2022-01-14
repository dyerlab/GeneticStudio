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
//  Locus.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
 

public class Locus: Identifiable, Equatable, Codable {
    
    public var id = UUID()
    public var alleles = [String]()
    public var isHeterozygote: Bool {
        return Set(alleles).count > 1 
    }
    public var ploidy: Int {
        return alleles.count 
    }
    
    public var isEmpty: Bool {
        return alleles.count == 0 
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case alleles
    }
    
    
    public init() { }
    
    public init( raw: String ) {
        self.alleles = raw.components(separatedBy: ":").sorted().filter{ $0 != ""}
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        id = try values.decode( UUID.self, forKey: .id )
        alleles = try values.decode( Array.self, forKey:  .alleles  )
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( id, forKey: .id )
        try container.encode( alleles, forKey: .alleles)
    }
    
    
    public static func ==(lhs: Locus, rhs: Locus) -> Bool {
        return lhs.alleles == rhs.alleles
    }
    
    
    public func setAlleles(values: String) {
        let a = values.components(separatedBy: ":").compactMap{ $0.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) }
        alleles = a
    }
    
}







extension Locus: CustomStringConvertible {
    
    public var description: String {
        let ret = String( self.alleles.joined(separator: ":") )
        if ret.isEmpty {
            return ".:."
        } else {
            return ret 
        }
    }
    
}



// MARK: - Genetic Distance
extension Locus {

    public func asVector( alleles: [String] ) -> Vector {
        
        var ret = Vector(repeating: 0.0, count: alleles.count )
        
        for a in self.alleles {
            if let i = alleles.firstIndex(of: a) {
                ret[i] = ret[i] + 1.0
            }
        }

        return ret
    }
    

    
}


