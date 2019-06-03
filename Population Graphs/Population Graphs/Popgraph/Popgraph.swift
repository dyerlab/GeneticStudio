//
//  Popgraph.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 5/29/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit

class Popgraph {
    var rootNode: SCNNode = SCNNode()
    var nodes: [PopgraphNode: [PopgraphEdge] ] = [:]
    
    func addNode(node: PopgraphNode ) {
        nodes[node] = []
        rootNode.addChildNode(node)
    }
    
    func newNode(label: String, radius: Float ) {
        let pos = SCNVector3Make( CGFloat.random(in: -50.0...50.0),
                                  CGFloat.random(in: -50.0...50.0),
                                  CGFloat.random(in: -50.0...50.0) )
        let cfg = PopgraphNodeConfig( radius: radius, label: label, position: pos )
        let node = PopgraphNode(config: cfg)
        addNode(node: node)
    }
    
    func addEdge(from: String, to: String, weight: Float ) {
        if let n1 = (nodes.keys.filter {$0.key == from}).first {
            if let n2 = (nodes.keys.filter {$0.key == to}).first {
                let edge = PopgraphEdge(from: n1, to: n2, weight: weight)
                n1.edges.append(edge)
                n2.edges.append(edge)
                rootNode.addChildNode(edge)
            }
        }
    }
    
    func recenter() {
        var centroid = SCNVector3Zero
        for (node, _) in nodes {
            centroid = centroid + node.position
        }
        centroid = centroid / (CGFloat(nodes.count))
        for (node, _ ) in nodes {
            node.position = node.position - centroid
        }
        print("Original Centroid: \(centroid)")
        
        centroid = SCNVector3Zero
        for (node, _) in nodes {
            centroid = centroid + node.position
        }
        centroid = centroid / (CGFloat(nodes.count))
        print("New Centroid: \(centroid)")
    }
}



extension Popgraph: CustomStringConvertible {
    var description: String {
        var ret = ""
        
        for node in self.nodes.keys {
            ret = ret + String("\(node) \n")
            for edge in node.edges {
                ret = ret + String("  \(edge)\n")
            }
        }
        return ret
    }
}





func makeLopho() -> Popgraph {
    
    let x : [CGFloat] = [ 29.00045, 19.84936, 34.23670,
                          44.54130, 26.67077, 19.63369,
                          50.00000, 27.36515, 33.28067,
                          44.93448, 34.98793, 41.26312,
                          -41.65762, -50.00000, -13.86461,
                          12.58385, -46.80490, -42.31178,
                          -30.82077, -25.10423, -30.02146 ]
    
    let y : [CGFloat] = [ -36.047221, -3.497619, -45.119258,
                          -39.344404, -36.089427, -17.980543,
                          -14.760220, -50.000000, -29.506534,
                          -26.591702, -30.768599, -47.704712,
                          38.378448, 25.877825, 9.386604,
                          -13.466044, 23.210591, 21.795451,
                          35.736199, 28.393259, 50.000000 ]
    
    let z : [CGFloat] = [ 27.27269, 30.16443, 30.00729,
                          24.56358, 18.70626, 28.46383,
                          50.00000, 20.74811, 41.82201,
                          33.35618, 18.34399, 18.49292,
                          -46.19857, -17.57970, -11.42709,
                          11.32907, -50.00000, -32.18441,
                          -25.79709, -34.53080, -39.45116 ]
    
    let labels = ["BaC", "Ctv", "LaV",
                  "Lig", "PtC", "PtP",
                  "SLG", "SnE", "SnF",
                  "SnI", "StR", "TsS",
                  "CP",  "LF",  "PL",
                  "SenBas", "Seri", "SG",
                  "SI",  "SN",  "TS"]
    
    let sizes: [Float] = [12.158810, 3.880886, 3.533757,
                          4.731355, 4.684652, 10.925375,
                          5.955645, 11.828220, 6.325655,
                          5.466695, 6.859545, 5.290570,
                          7.870725, 8.472215, 6.692795,
                          9.116705, 2.500000, 11.027530,
                          11.521450, 8.325785, 16.001165]
    
    let graph = Popgraph()
    
    for i in 0 ..< labels.count {
        let cfg = PopgraphNodeConfig( radius: sizes[i]/5.0,
                                      label: labels[i],
                                      position: SCNVector3Make( x[i], y[i], z[i] ) )
        let node = PopgraphNode(config: cfg )
        graph.addNode(node: node)
        if labels[i] == "SenBas" {
            node.toggleSelection()
        }
    }
    
    let edgeWeights: [Float] = [  9.052676,  9.716150, 12.382480,
                                  6.539983,  7.922799,  6.957130,
                                  6.76632,   2.655055,  1.383612,
                                  2.696431,  6.506860, 12.072820,
                                  12.800170,  8.49112,  10.386880,
                                  8.267106, 14.224830,  9.273806,
                                  9.026984, 12.801840, 12.39859,
                                  1.938340, 12.584040, 13.984130,
                                  2.984673,  4.434012,  6.568057,
                                  2.99936,   4.575605,  7.570517,
                                  9.946860,  4.821284,  7.665717,
                                  10.137190,  9.11179,   2.773351,
                                  3.988562,  4.143565,  4.269119,
                                  2.418533,  2.854111,  3.12762,
                                  9.176150,  3.533888,  2.915417,
                                  4.867766,  3.414492,  3.569675,
                                  3.83750,   4.875340,  4.558169,
                                  4.672005 ]
    
    let edgePairs = [
        [ "BaC", "LaV"],
        [ "BaC", "Lig"],
        [ "BaC", "PtC"],
        [ "BaC", "PtP"],
        [ "BaC", "SnE"],
        [ "BaC", "SnI"],
        [ "BaC", "StR"],
        [ "Ctv", "PtP"],
        [ "Ctv", "SLG"],
        [ "Ctv", "SnF"],
        [ "Ctv", "SenBas"],
        [ "LaV", "Lig"],
        [ "LaV", "PtC"],
        [ "LaV", "SnE"],
        [ "LaV", "SnF"],
        [ "LaV", "TsS"],
        [ "Lig", "PtC"],
        [ "Lig", "SnI"],
        [ "Lig", "StR"],
        [ "Lig", "TsS"],
        [ "PtC", "SnE"],
        [ "PtC", "StR"],
        [ "PtC", "TsS"],
        [ "PtC", "SenBas"],
        [ "PtP", "SnF"],
        [ "PtP", "SnI"],
        [ "PtP", "SenBas"],
        [ "SLG", "SnF"],
        [ "SLG", "SnI"],
        [ "SnE", "StR"],
        [ "SnE", "TsS"],
        [ "SnF", "SnI"],
        [ "SnI", "StR"],
        [ "StR", "TsS"],
        [ "StR", "SenBas"],
        [ "CP", "Seri"],
        [ "CP", "SG"],
        [ "CP", "SN"],
        [ "CP", "TS"],
        [ "LF", "PL"],
        [ "LF", "SG"],
        [ "LF", "SI"],
        [ "PL", "SenBas"],
        [ "PL", "SG"],
        [ "PL", "SI"],
        [ "PL", "SN"],
        [ "Seri", "SG"],
        [ "Seri", "SN"],
        [ "SG", "SI"],
        [ "SI", "SN"],
        [ "SI", "TS"],
        [ "SN", "TS"]
    ]
    
    for i in 0 ..< edgePairs.count {
        graph.addEdge(from: edgePairs[i][0], to: edgePairs[i][1], weight: edgeWeights[i]/40.0)
    }
    
    graph.recenter()
    
    print("The Graph: \n\(graph)")
    
    return graph
    
}
