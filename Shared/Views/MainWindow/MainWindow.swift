//
//  AnalysisList.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 12/26/21.
//

import SwiftUI

struct MainWindow: View {
    
    @Binding var document: GeneticStudioDocument
    
    var body: some View {
        NavigationView  {
                        
            List {
                HStack(alignment:.center) {
                    SpeciesView(image: document.image,
                                species: document.species)
                }
                Divider()
                NavigationLink(destination: {
                    GenotypeTable(stratum: $document.strata)
                }, label: {
                    AnalysisListViewItem(title: "Genotypes", subtitle: "View & Edit", image: "square.grid.3x3.square")
                } )
                
                
                Section(content: {
                    
                    NavigationLink(destination: {
                        Text("Frequencies")
                    }, label: {
                        AnalysisListViewItem(title: "Frequencies", subtitle: "Allele Spectra", image: "chart.pie")
                    })

                    NavigationLink(destination: {
                        Text("Allelic")
                    }, label: {
                        AnalysisListViewItem(title: "Allelic", subtitle: "A, A95, & Ae", image: "a.magnify")
                    })

                    NavigationLink(destination: {
                        Text("Genotypic")
                    }, label: {
                        AnalysisListViewItem(title: "Genotypic", subtitle: "Ho, He, & F", image: "g.circle")
                    })

                    NavigationLink(destination: {
                        Text("Spatial")
                    }, label: {
                        AnalysisListViewItem(title: "Spatial", subtitle: "Pies on maps!", image: "map")
                    })

                }, header: {
                    Text("Diversity")
                        .font(.title2 )
                })
                
                Section(content: {
                    
                    NavigationLink(destination: {
                        Text("AMOVA")
                    }, label: {
                        AnalysisListViewItem(title: "AMOVA", subtitle: "Partitioned Variance", image: "circle.grid.3x3.fill")
                    })
                    
                    NavigationLink(destination: {
                        Text("Ordination")
                    }, label: {
                        AnalysisListViewItem(title: "Ordination", subtitle: "Reprojected Genotypes", image: "square.and.line.vertical.and.square.filled")
                    })
                    
                    NavigationLink(destination: {
                        Text("Clustering")
                    }, label: {
                        AnalysisListViewItem(title: "Clustering", subtitle: "Nascent Partitions", image: "circle.grid.2x1.left.filled")
                    })
                    
                }, header: {
                    Text("Structure")
                        .font(.title3 )
                })
                
                Section(content: {
                    
                    NavigationLink(destination: {
                        Text("PopGraph Properties")
                    }, label: {
                        AnalysisListViewItem(title: "Properties", subtitle: "View & Edit", image: "slider.horizontal.3")
                    })
                    
                    NavigationLink(destination: {
                        Text("Structural")
                    }, label: {
                        AnalysisListViewItem(title: "Structural", subtitle: "Visual Display", image: "perspective")
                    })
                    
                    NavigationLink(destination: {
                        Text("Spatial")
                    }, label: {
                        AnalysisListViewItem(title: "Spatial Graphs", subtitle: "Graphs on Maps", image: "map.fill")
                    })
                }, header: {
                    Text("Popgraph")
                        .font(.title3 )
                })
                
                Spacer()
            }
            .frame(minWidth: 215, minHeight: 775)

            Text("main window")
        }
    }
}

struct MainWindow_Previews: PreviewProvider {
    static var previews: some View {
        MainWindow(document: .constant( GeneticStudioDocument.DefaultDocument() ))
            .frame(minWidth: 800, minHeight:800)
    }
}
