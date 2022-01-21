//
//  BarChart.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 2/15/21.
//


import SwiftUI

/// The General View for making a Bar Chart
///
/// This is the main view for making a bar chart.
public struct BarChartView: View {
    
    /// The raw data for the bars.
    @Binding public var data: [Double]
    
    /// The labels for each bar.
    @Binding public var labels: [String]
    
    /// Accent color is
    public let barColor: Color
    
    /// Color of the axes
    public let axisColor: Color
    
    /// Flag to indicate if the grid is to be shown
    public let showGrid: Bool
    
    /// Color of the background grid
    public let gridColor: Color
    
    /// Spacing between the bars.
    public let spacing: CGFloat
    
    private var minimum: Double { (data.min() ?? 0) * 0.95 }
    private var maximum: Double { (data.max() ?? 1) * 1.05 }
    
    public var body: some View {
        VStack {
            ZStack {
                if showGrid {
                    BarChartGrid(divisions: 10)
                        .stroke(gridColor.opacity(0.2), lineWidth: 0.5)
                }
                
                BarStack(data: $data,
                         labels: $labels,
                         barColor: barColor,
                         gridColor: gridColor,
                         showGrid: showGrid,
                         min: minimum,
                         max: maximum,
                         spacing: spacing)
                
                ChartAxes()
                    .stroke(Color.primary, lineWidth: 2)
            }
            LabelStack(labels: $labels, spacing: spacing)
        }
        .frame(width: 500, height: 500, alignment: .center)
        .padding([.horizontal, .top], 20)
    }
}



struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        let values = [23.4, 45.2, 26.0, 31.0, 18.0]
        let labels = ["First","Second","Third","Fourth","Fifth"]
        BarChartView(data: .constant( values ),
                     labels: .constant(labels),
                     barColor: Color.random(),
                     axisColor: .black,
                     showGrid: true,
                     gridColor: .blue,
                     spacing: 5.0)
            .frame(width: 550, height: 550, alignment: .center)
            .previewLayout( .sizeThatFits )
            
    }
}
