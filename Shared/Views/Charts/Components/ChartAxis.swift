//
//  BarChartAxis.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 2/15/21.
//

import SwiftUI

struct ChartAxes: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
    path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    
    return path
  }
}
