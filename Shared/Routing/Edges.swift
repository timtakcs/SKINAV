//
//  Edges.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/12/21.
//

import Foundation

public enum EdgeType {
    case directed, undirected
}

public struct Edge<T: Hashable> {
  public var source: Vertex<T>
  public var target: Vertex<T>
  public let weight: Int?
}

extension Edge: Hashable {
  
  public var hashValue: Int {
      return "\(source)\(target)\(weight)".hashValue
  }
  
  static public func == (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    return lhs.source == rhs.source &&
      lhs.target == rhs.target &&
      lhs.weight == rhs.weight
  }
}
