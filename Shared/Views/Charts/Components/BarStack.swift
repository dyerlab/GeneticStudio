//
//  BarStack.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 2/15/21.
//

import SwiftUI

struct BarStack: View {
    @Binding var data: [Double]
    @Binding var labels: [String]
    public let barColor: Color
    let gridColor: Color
    let showGrid: Bool
    let min: Double
    let max: Double
    let spacing: CGFloat
    
    var body: some View {
        HStack(alignment: .bottom, spacing: spacing) {
            ForEach(0 ..< data.count) { index in
                LinearGradient(
                    gradient: .init(
                        stops: [
                            .init(color: barColor, location: 0),
                            .init(color: barColor, location: 0.15),
                            .init(color: barColor, location: 1)
                        ]),
                    startPoint: .bottom,
                    endPoint: .top
                    )
                    .clipShape(BarPath(data: data[index], max: max, min: min))
            }
        }
        .shadow(color: .black, radius: 2, x: 1, y: 1)
        .padding(.horizontal, spacing)
    }
}

struct BarStack_Previews: PreviewProvider {
    static var previews: some View {
        let data = [2.3, 2.76, 3.1]
        let labels = ["First","Second","Third"]
        BarStack(data: .constant(data),
                 labels: .constant(labels),
                 barColor: .red,
                 gridColor: .gray,
                 showGrid: true,
                 min: 20,
                 max: 500,
                 spacing: 1.0)
            .frame(width: 500, height: 500, alignment: .center)
    }
}
