//
//  Vertices.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/12/21.
//

import Foundation

public struct Vertex<T: Hashable>: Identifiable   {
    public var id = UUID()
    public var data: T
    public var level: Int
}

extension Vertex: Hashable {
    public var hashValue: Int {
        return "\(data)".hashValue
    }
    static public func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
  public var description: String {
    return "\(data)"
  }
}

