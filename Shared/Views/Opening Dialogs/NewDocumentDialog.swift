//
//  NewDocumentDialog.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 12/29/21.
//

import SwiftUI

struct NewDocumentDialog: View {
    @Binding var document: GeneticStudioDocument
    
    var body: some View {
        HStack {
            
            VStack {
                
                
                GeneticStudioLogo()
                

                VStack(alignment: .leading ) {
                    // The Import Component
                    HStack {
                        Image(systemName: "arrow.down.doc.fill")
                            .font(.largeTitle)
                            
                        VStack(alignment: .leading) {
                                Text("Import New Dataset.")
                                .font( .title3)
                                Text("Load in new csv file.")
                                .font( .subheadline )
                                .foregroundColor( .secondary )
                        }
                    }
                    .onTapGesture {
                        print("clicked import")
                    }
                    .padding(3)
                    
                    // The Open Compoentn
                    HStack {
                        Image(systemName: "folder.fill")
                            .font(.largeTitle)
                            
                        VStack(alignment: .leading) {
                                Text("Open existing file.")
                                .font( .title3)
                                Text("Open existing GeneticStudio document.")
                                .font( .subheadline )
                                .foregroundColor( .secondary )
                        }
                    }
                    .padding(3)

                }
                
                
                
                
                
            }
            .padding()
            .frame(minWidth: 375 )
            
            // The list of recent files.
            VStack {
                
                List{
                    
                }
            }
            
        }
        .frame(minWidth: 600)
        
    }
}

struct NewDocumentDialog_Previews: PreviewProvider {
    static var previews: some View {
        NewDocumentDialog(document: .constant( GeneticStudioDocument() ))
        
    }
}
