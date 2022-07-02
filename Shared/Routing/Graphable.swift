//
//  Graphable.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/12/21.
//

import Foundation

protocol Graphable {
  associatedtype Element: Hashable
  associatedtype Level: Hashable
    
  var description: CustomStringConvertible { get }
  
  func createVertex(data: Element, level: Level) -> Vertex<Element>
  func add(_ type: EdgeType, from source: Vertex<Element>, to target: Vertex<Element>, weight: Int?)
  func weight(from source: Vertex<Element>, to target: Vertex<Element>) -> Int?
  func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}

enum Visit<Element: Hashable> {
    case source
    case edge(Edge<Element>)
}

extension Graphable {
    public func findPath(from source: Vertex<Element>, to target: Vertex<Element>) -> [Edge<Element>]? {
        var queue = Queue<Vertex<Element>>()
        queue.enqueue(element: source)
//        var routes = [[Edge<Element>]]()
        var visits : [Vertex<Element> : Visit<Element>] = [source: .source]
        
        while let checkedVertex = queue.dequeue() {
            if checkedVertex == target {
                var vertex = target
                var route: [Edge<Element>] = []
                
                while let visit = visits[vertex],
                    case .edge(let edge) = visit {
                    
                    route = [edge] + route
                    vertex = edge.source
                }
                return route
            }
            let connectedEdges = edges(from: checkedVertex) ?? []
            for edge in connectedEdges {
                if visits[edge.target] == nil{
                    queue.enqueue(element: edge.target)
                    visits[edge.target] = .edge(edge)
                }
            }
        }
        print("Path not found")
        return nil
    }
    
    public func bubbleSort(inputArray: [[Vertex<Element>]]) -> [[Vertex<Element>]]{
        var array = inputArray
        let length = array.count
        
        for i in 0..<length - 1 {
            for j in 0..<length - i - 1 {
                if array[j].count > array[j + 1].count {
                    let temp = array[j + 1]
                    array[j + 1] = array[j]
                    array[j] = temp
                }
            }
        }
        return array
    }
    
    public func findAllPaths(from source: Vertex<Element>, to target: Vertex<Element>, level: Int) -> [[Vertex<Element>]]? {
        
        print(source.data)
        print(target.data)
        print(level)
        var counter = 0
        
        var queue = Queue<[Vertex<Element>]>() // initialize the queue
        let source: [Vertex<Element>] = [source] // create an array of the source vertex to enqueue
        var routes: [[Vertex<Element>]] = [] // initialize routes array
        queue.enqueue(element: source)
        
        while let check = queue.dequeue(), routes.count < 3{
//            print(check)
//            print(routes)
//            print(counter)
            if (check.last!.data == target.data){ //if the last vertex in the array is the target, add it to routes if it isnt a duplicate
                if !routes.contains(check) {
                    routes.append(check)
                }
                
            }
            else {
                let edges = edges(from: check.last!) // if it isn't the target, return all connected edges
                for edge in edges! {
                    if edge.target.level <= level {
                        // if the level of the end vertex of the edge is < the user's level, consider
                            var newCheck = check // create a copy of the initial path array
                            newCheck.append(edge.target) // append vertex
                            queue.enqueue(element: newCheck) // enqueue new path
                            //loop for each connected edge
                    }
                }
            }
            counter += 1
        }
       return routes
    }
    
    public func getTime(array: [Vertex<String>], userLevel: Int64) -> Int {
        var totalTime = 0
        var speed: Int = 0
        
        for step in 0..<array.count - 1{
            if array[step].level == 0 {
                speed = 5
            }
            else {
                switch userLevel {
                case 2:
                    speed = 25
                case 3:
                    speed = 35
                default:
                    speed = 15
                }
            }
            
            totalTime += (Int(weight(from: array[step] as! Vertex<Self.Element>, to: array[step + 1] as! Vertex<Self.Element>)!)) / speed
        }
        
        return totalTime * 10
    }
}




