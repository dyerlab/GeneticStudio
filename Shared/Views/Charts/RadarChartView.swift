//
//  RadarChartView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 2/15/21.
//

import SwiftUI


/// The default Radar Structure plot view
public struct RadarChartView: View {
    
    /// The data associated with the chart
    var data: [Double]
    
    /// The background grid color
    let gridColor: Color
    
    /// The color for the area of the data itself.
    let dataColor: Color
    
    /// Default initializer for the plot
    /// - Parameters:
    ///   - data: Vector of data
    ///   - gridColor: Grid color, defaults to `Color.gray`
    ///   - dataColor: Data color, defaults to `Color.blue`
    init(data: [Double], gridColor: Color = .gray, dataColor: Color = .blue) {
        self.data = data
        self.gridColor = gridColor
        self.dataColor = dataColor
    }
    
    /// The actual body
    public var body: some View {
        ZStack {
            RadarChartGrid(categories: data.count, divisions: 10)
                .stroke(gridColor, lineWidth: 0.5)
            
            RadarChartPath(data: data)
                .fill(dataColor.opacity(0.3))
            
            RadarChartPath(data: data)
                .stroke(dataColor, lineWidth: 2.0)
            
        }
    }
}


struct RadarChartView_Previews: PreviewProvider {
    static var previews: some View {
        RadarChartView(data: [2.34, 4.3, 2.5, 5.3, 6.2, 3.5],
                       gridColor: .gray,
                       dataColor: Color.random() )
            .frame(width: 500, height: 500, alignment: .center)
            .previewLayout( .sizeThatFits )
    }
}
