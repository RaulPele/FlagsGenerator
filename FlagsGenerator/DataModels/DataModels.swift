//
//  models.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 02.08.2022.
//

import Foundation
import SwiftUI

enum Orientation {
    case vertical
    case horizontal
}

protocol FlagComponent {
    var id: UUID {get set}
}

struct Stripe: FlagComponent {
    var id = UUID()
    var color = Color.red
}

struct SymbolStripe: FlagComponent {
    var id = UUID()
    var color: Color
    var symbol: String
}

struct Stack: FlagComponent {
    var id = UUID()
    var orientation: Orientation
    private(set) var components = [Stripe]()
    
    mutating func addComponent(component: Stripe) {
        self.components.append(component)
    }
}

struct FlagDataModel {
    var tree = Tree()
}

extension FlagDataModel {
    static func mock1() -> FlagDataModel {
        let model = FlagDataModel(tree:
            Tree(root:
                Node(value: Stack(orientation: .horizontal), children: [
                    Node(value: Stripe(color: Color.blue)),
                    Node(value: Stripe(color: Color.yellow)),
                    Node(value: Stripe(color: Color.red))
                ])
            )
        )
       
        return model
    }
    
    static func mock2() -> FlagDataModel {
        let model = FlagDataModel(tree:
            Tree(root:
                Node(value: Stack(orientation: .vertical), children: [
                    Node(value: Stack(orientation: .horizontal), children: [
                        Node(value: Stripe(color: Color.blue)),
                        Node(value: Stripe(color: Color.yellow)),
                        Node(value: Stack(orientation: .vertical), children: [
                            Node(value: Stripe(color: Color.blue)),
                            Node(value: Stripe(color: Color.green))
                        ])
                    ]),
                    Node(value: Stripe(color:.mint))
                ])
            )
        )
        
        return model
    }
}
