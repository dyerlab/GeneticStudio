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
        let cfg = PopgraphNodeConfig( radius: radius, label: label )
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
    }
}






func makeLopho() -> Popgraph {
    let coords = [
        [ 0.31776847, -0.44154949,  0.3588540],
        [ 0.18818370,  0.06240881,  0.4045754],
        [ 0.39191691, -0.58200983,  0.4020909],
        [ 0.53783606, -0.49259905,  0.3160202],
        [ 0.28477884, -0.44220296,  0.2234099],
        [ 0.18512972, -0.16182711,  0.3776871],
        [ 0.61513442, -0.11196756,  0.7181963],
        [ 0.29461170, -0.65757728,  0.2556936],
        [ 0.37837892, -0.34028148,  0.5888938],
        [ 0.54340362, -0.29515178,  0.4550403],
        [ 0.40255467, -0.35982175,  0.2176820],
        [ 0.49141514, -0.62203985,  0.2200368],
        [-0.68279110,  0.71076669, -0.8028027],
        [-0.80092415,  0.51722231, -0.3503087],
        [-0.28922585,  0.26189238, -0.2530296],
        [ 0.08529988, -0.09193012,  0.1067688],
        [-0.75567960,  0.47592611, -0.8629072],
        [-0.69205449,  0.45401581, -0.5812243],
        [-0.52933507,  0.66985734, -0.4802342],
        [-0.44838545,  0.55616821, -0.6183231],
        [-0.51801634,  0.89070061, -0.6961192]
    ]
    
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
        let cfg = PopgraphNodeConfig(radius: sizes[i], label: labels[i] )
        let node = PopgraphNode(config: cfg )
        node.position = SCNVector3( coords[i][0]*100.0 - 50.0,
                                    coords[i][1]*100.0 - 50.0,
                                    coords[i][2]*100.0 - 50.0 )
        graph.addNode(node: node)
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
        graph.addEdge(from: edgePairs[i][0], to: edgePairs[i][1], weight: edgeWeights[i]/10.0)
    }
    
    graph.recenter()
    
    return graph
    
}
