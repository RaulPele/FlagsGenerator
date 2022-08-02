//
//  Tree.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 02.08.2022.
//

import Foundation

class Node {
    var id = UUID()
    var value: FlagComponent
    private(set) var children: [Node] = []
    
    weak var parent: Node?
    
    
    init(value: FlagComponent) {
        self.value = value
    }
    
    init(value: FlagComponent, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

class Tree {
    var root: Node
    var currentParent: Node
    
    init(root: Node) {
        self.root = root
        currentParent = self.root
    }
    
    func add(node: Node) {
        currentParent.add(child: node)
    }
}
