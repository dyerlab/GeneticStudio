//
//  Color.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 12/26/21.
//

import SwiftUI

extension Color {
    
    static var gstudioAccentOne: Color {
        return Color("GStudioAccentOne")
    }
    
    static var gstudioAccentTwo: Color {
        return Color("GStudioAccentTwo")
    }
    
    static func getSpacedColor(index: Int, of: Int, saturation: Double = 0.5, brightness: Double = 0.95 ) -> Color {
        let hue = Double(index) * (1.0 / Double(of))
        return Color(hue: hue, saturation: saturation , brightness: brightness )
    }
    
    static func random() -> Color {
        return Color(
            red:   .random( in: 0...1.0 ),
            green: .random( in: 0...1.0 ),
            blue:  .random( in: 0...1.0 )
        )
    }
    
    static func hslColor( number: Int, of: Int ) -> Color {
        return Color.init(hue: Double(number)/Double(of), saturation: 2.0/3.0, brightness: 2.0/3.0)
    }
    
    
    static func getColorRange(numColors: Int, saturation: Double = 1.0, brightness: Double = 1 ) -> [Color] {
        var ret = [Color]()
        for i in 0 ..< numColors {
            ret.append( Color.getSpacedColor(index: i, of: numColors,saturation: saturation, brightness: brightness ) )
        }
        
        return ret
    }
    
    
}
