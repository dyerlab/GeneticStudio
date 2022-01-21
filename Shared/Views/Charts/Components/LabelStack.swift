//
//  LabelStack.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 2/15/21.
//

import SwiftUI

struct LabelStack: View {
  @Binding var labels: [String]
  let spacing: CGFloat
  
  var body: some View {
    HStack(alignment: .center, spacing: spacing) {
      ForEach(labels, id: \.self) { label in
        Text(label)
          .frame(maxWidth: .infinity)
      }
    }
    .padding(.horizontal, spacing)
  }
}

struct LabelStack_Previews: PreviewProvider {
    static var previews: some View {
        let labels = ["Bob","Alice"]
        LabelStack(labels: .constant(labels), spacing: 1.0)
    }
}
