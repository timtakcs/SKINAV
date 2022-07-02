//
//  AdjacencyList.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/12/21.
//

import Foundation

open class AdjacencyList<T: Hashable> {
    public var vertextList: [Vertex<T>] = []
    public var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
    
    fileprivate func addDirectedEdge(from source: Vertex<Element>, to target: Vertex<Element>, weight: Int?) {
        let edge = Edge(source: source, target: target, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
    fileprivate func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Int?) {
      let (source, target) = vertices
      addDirectedEdge(from: source, to: target, weight: weight)
      addDirectedEdge(from: target, to: source, weight: weight)
    }
}

extension AdjacencyList: Graphable {
    public typealias Element = T
    public typealias Level = Int
    
    public func createVertex(data: Element, level: Level) -> Vertex<Element> {
        let vertex = Vertex(data: data, level: level)
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
      }

      return vertex
    }
    
    public func add(_ type: EdgeType, from source: Vertex<Element>, to target: Vertex<Element>, weight: Int?) {
      switch type {
      case .directed:
        addDirectedEdge(from: source, to: target, weight: weight)
      case .undirected:
        addUndirectedEdge(vertices: (source, target), weight: weight)
      }
    }

    
    public func weight(from source: Vertex<Element>, to target: Vertex<Element>) -> Int? {
        guard let edges = adjacencyDict[source] else {
            return nil
        }
        for edge in edges{
            if edge.target == target{
                return edge.weight
            }
        }
        return nil
    }
    
    public func edges(from source: Vertex<Element>) -> [Edge<Element>]?{
        return adjacencyDict[source]
    }
    
    public var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict{
            var edgeString = ""
            for (index, edge) in edges.enumerated(){
                if index != edges.count - 1 {
                    edgeString.append("\(edge.target), ")
                }
                else {
                    edgeString.append("\(edge.target)")
                }
            }
            result.append("\(vertex) ---> [\(edgeString)] \n")
        }
        return result
    }
    
    
}

