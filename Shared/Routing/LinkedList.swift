//
//  LinkedList.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/14/21.
//

import Foundation

public class Node<T> {
    var data: T
    var nextNode: Node<T>?
    weak var prevNode: Node<T>?
    
    init(data: T) {
        self.data = data
    }
}

public class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public func isEmpty() -> Bool {
        if head == nil {
            return true
        }
        else {
            return false
        }
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func append(data: T){
        let newNode = Node(data: data)
        if let tailNode = tail{
            newNode.prevNode = tailNode
            tailNode.nextNode = newNode
        }
        else if isEmpty() == true {
            head = newNode
        }
        tail = newNode
    }
    
    public func remove(node: Node<T>) -> Node<T> {
        let prev = node.prevNode
        let next = node.nextNode
        
        if let prev = prev{
            prev.nextNode = next
        }
        else{
            head = next
        }
        
        if next == nil{
            tail = prev
        }
        
        node.prevNode = nil
        node.nextNode = nil
        
        return node
    }
}
