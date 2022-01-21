//
//  PieChart.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 2/15/21.
//

import SwiftUI

/// General View for a Pie Chart
public struct PieChartView: View {
    
    /// Values for the size of the widges
    @Binding public var data: [Double]
    
    /// Labels for each of the slices
    @Binding public var labels: [String]
    
    private var colors: [Color]
    private let borderColor: Color
    private let sliceOffset: Double = -.pi / 2
    
    
    
    /// Basic Initializer for Bar Charts.
    /// - Parameters:
    ///   - data: Vector of data representing size of each slice
    ///   - labels: `String` labels for each slice
    ///   - colors: Optional set of colors that can be used.
    ///   - borderColor: The color of the boraders around the pie slices
    init(data: Binding<[Double]>, labels: Binding<[String]>, colors: [Color], borderColor: Color) {
        self._data = data
        self._labels = labels
        
        if colors.count != data.count {
            self.colors = Array(repeating: Color.random(), count: data.count)
        } else {
            self.colors = colors
        }
        self.borderColor = borderColor
    }
    
    
    /// Default Constructor for ``AlleleFrequencies`` objects.
    /// - Parameter freqs: The Frequency for a single locus
    init( freqs: AlleleFrequencies ) {
        self.borderColor = .gray
        self._labels = .constant(freqs.alleles)
        self._data = .constant(freqs.frequenciesFor(alleles: freqs.alleles) )
        self.colors = [Color]()
        colors = Color.getColorRange(numColors: self.data.count)
    }
    
    
    /// The Body 
    public var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .center) {
                ForEach(0 ..< data.count) { index in
                    
                    PieSlice(startAngle: startAngle(for: index), endAngle: endAngle(for: index))
                        .fill(colors[index % colors.count])
                    
                    PieSlice(startAngle: startAngle(for: index), endAngle: endAngle(for: index))
                        .stroke(Color.white, lineWidth: 1)
                    
                    PieSliceText(
                        title: "\(labels[index])",
                        description: String(format: "%.3f", data[index])
                    )
                    .offset(textOffset(for: index, in: geo.size))
                    .zIndex(1)
                }
            }
        }
    }
    
    private func startAngle(for index: Int) -> Double {
        switch index {
        case 0:
            return sliceOffset
        default:
            let ratio: Double = data[..<index].reduce(0.0, +) / data.reduce(0.0, +)
            return sliceOffset + 2 * .pi * ratio
        }
    }
    
    private func endAngle(for index: Int) -> Double {
        switch index {
        case data.count - 1:
            return sliceOffset + 2 * .pi
        default:
            let ratio: Double = data[..<(index + 1)].reduce(0.0, +) / data.reduce(0.0, +)
            return sliceOffset + 2 * .pi * ratio
        }
    }
    
    private func textOffset(for index: Int, in size: CGSize) -> CGSize {
        let radius = min(size.width, size.height) / 3
        let dataRatio = (2 * data[..<index].reduce(0, +) + data[index]) / (2 * data.reduce(0, +))
        let angle = CGFloat(sliceOffset + 2 * .pi * dataRatio)
        return CGSize(width: radius * cos(angle), height: radius * sin(angle))
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        let theData = [1.0,2.0,5.0]
        let theLabels = ["A","B","C"]
        Group {
            PieChartView(data: .constant(theData),
                     labels: .constant(theLabels),
                     colors: [.red, .green, .blue],
                 borderColor: .gray )
                .frame(width: 500, height: 500, alignment: .center)
                .previewLayout( .sizeThatFits )
            
            PieChartView(freqs: AlleleFrequencies.DefaultFrequencies() )
                .frame(width: 500, height: 500, alignment: .center)
                .previewLayout( .sizeThatFits )
        }
    }
}
