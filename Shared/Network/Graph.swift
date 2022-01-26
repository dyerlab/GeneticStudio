//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
// 
//  GeneticStudio
//  Graph.swift
//
//  Created by Rodney Dyer on 10/29/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import MapKit
import SceneKit


class Graph: Identifiable, Codable {
    var id = UUID()
    var nodes = [Node]()
    var edges = [Edge]()
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    var isSpatial: Bool {
        return nodes.compactMap{ $0.coordinate.isZero }.all
    }
    
    func addNode( label: String, size: Double ) {
        self.nodes.append( Node(label: label, size: size) )
    }
    
    func getNode( named: String ) -> Node? {
        return nodes.filter{ $0.label == named }.first
    }
    
    func addEdge( from: String, to: String, weight: Double, directed: Bool = false ) {
        if let node1 = getNode(named: from ),
           let node2 = getNode( named: to )  {
            self.edges.append( Edge(fromNode: node1, toNode: node2, weight: weight))
            if !directed {
                self.edges.append( Edge(fromNode: node2, toNode: node1, weight: weight))
            }
        }
    }
    

}





extension Graph: CustomStringConvertible {
    var description: String {
        var ret = "Graph\n Nodes\n"

        for node in nodes {
            ret += String("  \(node.description) \n")
        }
        ret += " Edges:\n"
        for edge in edges {
            ret += String( "  \(edge.description) \n")
        }
 
        return ret
        
    }
}




// MARK: - Spatial Extensions


extension Graph {
    
    var center: CLLocationCoordinate2D {
        return nodes.compactMap{ $0.coordinate }.center
    }
    
    var coordinateRegion: MKCoordinateRegion {
        return MKCoordinateRegion(coordinates: nodes.compactMap{ $0.coordinate} )
    }

    
    var nodeAnnotations: [MKPointAnnotation] {
        return nodes.compactMap{ $0.pointAnnotation }
    }
    
    var placeMarkers: [PlaceMarker] {
        return nodes.compactMap{ $0.placeMarker }
    }
    
    var edgePolyLines: [MKPolyline] {
        return edges.compactMap{ $0.polyline }
    }
    
   
    
}


// MARK: - Graph Layouts

extension Graph {
    
    /*
    func spriteViewCoordinator() -> GraphSpriteViewCoordinator {
        let ret = GraphSpriteViewCoordinator(graph: self)
        return ret
    }
    */
    
    
}





// MARK: - Default Graph
extension Graph {
    
    static func DefaultGraph() -> Graph {
        /*
        guard let path = Bundle(identifier: "com.dyerlab.GeneticStudio")?.path(forResource: "arapat", ofType: "pgraph") else { return Graph() }
        return loadPopGraph(path: path )
         */
        
        let graph = Graph()
        
        graph.addNode(label: "A", size: 20.0)
        graph.addNode(label: "B", size: 10.0)
        graph.addNode(label: "C", size: 30.5)
        graph.addNode(label: "D", size: 40.0)
        
        graph.addEdge(from: "A", to: "B", weight: 2.0)
        graph.addEdge(from: "A", to: "C", weight: 2.0)
        graph.addEdge(from: "B", to: "C", weight: 2.0)
        graph.addEdge(from: "C", to: "D", weight: 2.0)
        
        
        
        return graph
        
    }
    
}
