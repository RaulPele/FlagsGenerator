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
    var children: [Node] = []
    
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
    var root: Node?
    var currentParent: Node?
    var lastAddedChild: Node?
    
    init() {
        
    }
    
    init(root: Node) {
        self.root = root
        currentParent = root
        lastAddedChild = currentParent
    }
    
    func add(child: Node) {
        if root == nil {
            root = child
            currentParent = root
            lastAddedChild = root
        } else {
            currentParent!.add(child: child)
            lastAddedChild = child
        }
    }
    
    func add(subsection: Node) {
        if let currentParent = currentParent {
            if currentParent.value is Stack && !currentParent.children.isEmpty {
                currentParent.children.removeLast()
                currentParent.add(child: subsection)
            }
            
            subsection.add(child: lastAddedChild!)
            if self.currentParent === root && currentParent.children.isEmpty {
                root = subsection
                self.currentParent = root
            } else {
                self.currentParent = subsection
            }
        }
    }
    
    func moveUp() {
        guard root != nil else {
            return
        }
        
        if let newParent = currentParent?.parent {
            currentParent = newParent
            lastAddedChild = newParent.children.last!
        } else {
            //we are in the root node which has no parent -> create a new parent
            let newRoot = Node(value: Stack(orientation: getNewOrientation()), children: [currentParent!])
            currentParent!.parent = newRoot
            self.root = newRoot
            currentParent = self.root
            lastAddedChild = newRoot.children.last!
        }
    }
    
    func getNewOrientation() -> Orientation {
        guard let rootStack = root?.value as? Stack else {
            return .vertical
        }
        
        if rootStack.orientation == .vertical {
            return .horizontal
        }
        
        return .vertical
    }
}
