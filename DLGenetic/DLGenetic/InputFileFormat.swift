//
//  InputFileFormat.swift
//  PopgenKit
//
//  Created by Rodney Dyer.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation


/**
 Struct to hold fileinput data for genotypes from text.
 
 All input text should be in the following format.
 - Text file saved as CSV
 - Strata columns then coordinates then loci
 - Header row with column names (case sensitive)
 - The name `Population` will be considered primary sampling strata.
 - The names `Longitude` and `Latitude` will be required and put the coordinates in damn decimal degrees already!
 - Loci are single column with alleles separated by a colon `:`
 */
struct InputFileFormat {
    /// Number of columns for individual strata
    var numStrata: Int
    /// Each individual has coordiante flag
    var hasCoordinates: Bool
    /// Number of loci to use
    var numLoci: Int
}

