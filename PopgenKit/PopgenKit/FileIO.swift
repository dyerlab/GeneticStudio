//
//  FileIO.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 5/24/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

/**
 Parse delimited file into [[String]] object.
 
 - Parametes:
 - path: String representing path to the file
 - delimiter: String object to separate columns from each row.
 
 - Returns: An array of string array objects.
 */
func parseDelimitedFile(path: String, delimiter: String) -> [[String]] {
    let url = URL(fileURLWithPath: path)
    let contents: String
    var lines = [String]()
    var data = [[String]]()

    do {
        contents = try String(contentsOf: url)
        lines = contents.components(separatedBy: "\n")
    } catch {
        print( error.localizedDescription )
    }

    data.reserveCapacity(lines.count)
    for line in lines {
        data.append( line.components(separatedBy: delimiter))
    }
    return data
}
