//
//  File.swift
//  
//
//  Created by Rodney Dyer on 1/10/22.
//

import Foundation


/// A ViewModel object for displaying Genetic Diversity parametes by locus and stratum.
public class DiversityViewModel {
    
    /// Parameters for each stratum level
    public var parameters: [String: DiversityParameters] = [:]
    
    /// All strata sorted appropriately
    public var allStrata: [String] {
        return parameters.keys.sorted {$0.localizedStandardCompare($1) == .orderedAscending}
    }
    
    /// The locus being examined
    public var locus: String = ""
    
    /// Dummy initializer
    init() { }
    
    /// Designated Initializer
    public init( stratum: Stratum, level: String, locus: String ) {
        self.locus = locus
        let freqs = FrequencyViewModel(stratum: stratum, level: level, locus: locus)
        for (key,val) in freqs.parameters {
            parameters[key] = DiversityParameters(frequencies: val )
        }
    }

    public func diversityMatrix(type: DiversityType) -> Matrix {
        let keys = type == .Allelic ? ["A","A95","Ae"] : ["Ho","He","F"]
        let names = parameters.keys.sorted()
        
        let ret = Matrix( names.count, keys.count, 0.0 )
        ret.colNames = keys
        ret.rowNames = names
        
        for i in 0 ..< names.count {
            let model = parameters[ names[i], default: DiversityParameters() ]
            
            if type == .Allelic  {
                ret[i,0] = Double( model.A )
                ret[i,1] = Double( model.A95 )
                ret[i,2] = model.Ae
            }
            else {
                ret[i,0] = model.Ho
                ret[i,1] = model.He
                ret[i,2] = model.F
            }
        }
        
        return ret
    }
}




// MARK: - Default Stuff
extension DiversityViewModel {
    
    public static func DefaultDiversityViewModel() -> DiversityViewModel {
        return DiversityViewModel(stratum: Stratum.DefaultStratum(),
                                  level: "Region",
                                  locus: "MP20")
    }
    
}

