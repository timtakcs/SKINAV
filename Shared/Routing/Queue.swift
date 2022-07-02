//
//  Queue.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/14/21.
//

import Foundation

public struct Queue<T> {
    fileprivate var list = LinkedList<T>()
    
    public mutating func enqueue(element: T){
        list.append(data: element)
    }
    
    public mutating func dequeue() -> T?{
        if(list.isEmpty() == false) {
            let element = list.remove(node: list.first!)
            return element.data
        }
        else {
            return nil
        }
    }
    
    public var isEmpty: Bool {
        if list.isEmpty() == true {
            return true
        }
        else {
            return false
        }
    }
}

