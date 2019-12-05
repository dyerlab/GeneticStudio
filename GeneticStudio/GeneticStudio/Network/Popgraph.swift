//
//  Popgraph.swift
//  PopgenKit
//
//  Created by Rodney Dyer on 6/14/19.
//

import Foundation
import SceneKit
import DLabKit

final public class Popgraph {
    
    /// Root of all plotting nodes for SceneKit visualization
    var rootNode: SCNNode
    /// List of `Node` objects
    var nodes: [Node]
    /// List of `Edge` objects
    var edges: [Edge]
    
    /// Designated initializer
    public init() {
        self.nodes = [Node]()
        self.edges = [Edge]()
        self.rootNode = SCNNode()
    }
    
    /// Adds a new node to the graph
    func addNode( label: String, size: Double ) {
        addNode( Node(label: label, size: size) )
    }
    
    /// Adds an existing node to the graph
    func addNode(_ node: Node ) {
        self.rootNode.addChildNode(node)
        self.nodes.append(node)
    }
    
    
    /// Adding a new edge to the graph
    ///
    /// - Parameter from: The starting `Node`
    /// - Parameter to: The ending `Node`
    /// - Parameter weight: The strength of the edge
    /// - Parameter symmetric: A flag indicating that edges connect in both directions (default `true`)
    func addEdge( from: String, to: String, weight: Double, symmetric: Bool ) {
        if let n1 = getNode(label: from), let n2 = getNode(label: to) {
            let e12 = Edge(from: n1, to: n2, weight: weight)
            self.edges.append( e12 )
            n1.edges.append( e12 )
            if symmetric {
                let e21 = Edge(from:n2, to: n1, weight: weight)
                n2.edges.append( e21 ) 
                self.edges.append( e21 )
            }
        }
    }
    
    /// Get a connecting `Node` from label.
    ///
    /// - Parameter label: The label of the nodes
    /// - Returns: A `Node` (or nil) with the label
    func getNode( label: String ) -> Node? {
        return self.nodes.filter{$0.label == label}.first
    }
    
    /// Returns an edge based upon connected `Node` labels
    ///
    /// - Parameter from: The `Node` label where the edge originates
    /// - Parameter to: The `Node` lable where the edge terminates
    /// - Returns: An `Edge` (if it exists) connecting from <-> to `Node` objects
    func getEdge( from: String, to: String ) -> Edge? {
        return self.edges.filter{ $0.connects(from: from, to: to)}.first
    }
    
}



/// MARK: -

extension Popgraph: MatrixAdaptable {

    /// 
    public func asMatrix() -> Matrix {
        let nodeLabels = self.nodes.map{ $0.label }
        var ret = Matrix(rows: nodeLabels.count, cols: nodeLabels.count)
        
        for e in self.edges {
            if let ridx = nodeLabels.firstIndex(of: e.source.label),
                let cidx = nodeLabels.firstIndex(of: e.destination.label) {
                ret[cidx,ridx] = e.weight
                ret[ridx,cidx] = e.weight
            }
        }
        return ret
    }
    
}



extension Popgraph: CustomStringConvertible {
    
    public var description: String {
        var ret = "Graph\n"
        self.nodes.forEach{ node in
            ret = ret + "\(node)\n"
        }
        return ret
    }
}
