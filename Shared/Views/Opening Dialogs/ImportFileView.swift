//
//  ImportFileView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 12/30/21.
//

import SwiftUI

struct ImportFileView: View {
    @Binding var document: GeneticStudioDocument
    
    
    var body: some View {
        VStack {
            GeneticStudioLogo()
            
            Divider()
            

            VStack( alignment: .leading ) {
                Text("File Properties")
                    .font( .title3 )
                
                HStack {
                    Text("File Location:")
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "arrow.down.doc.fill")
                            .font(.largeTitle)
                    })
                }
                .frame(minHeight: 40)
                .padding()
            }

            
            
        }
    }
}

struct ImportFileView_Previews: PreviewProvider {
    static var previews: some View {
        ImportFileView(document: .constant( GeneticStudioDocument() ))
    }
}
