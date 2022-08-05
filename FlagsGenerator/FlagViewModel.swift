//
//  FlagViewModel.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 02.08.2022.
//

import Foundation
import SwiftUI

class FlagViewModel: ObservableObject {
    @Published var flagDataModel: FlagDataModel
    @Published var selectedColor = Color(red: 0.98, green: 0.9, blue: 0.2)
    
    init() {
        flagDataModel = FlagDataModel()
    }
    
    init(flagDataModel: FlagDataModel) {
        self.flagDataModel = flagDataModel
    }
    
    func addSubsection(orientation: Orientation) {
        let subsection = Node(value: Stack(orientation: orientation))
        flagDataModel.tree.add(subsection: subsection)
        self.objectWillChange.send()
    }
    
    func addStripe() {
        print("Add stripe called")
            
        let stripe = Node(value: Stripe(color: selectedColor))
        flagDataModel.tree.add(child: stripe)
        self.objectWillChange.send()
        
        print(stripe.value)
    }
    
    func commitSection() {
        flagDataModel.tree.moveUp()
    }
    
    func createFlag() -> some View {
        guard let rootNode = flagDataModel.tree.root else {
            return AnyView(Color.gray)
        }
        
        guard let rootStack = rootNode.value as? Stack else {
            return AnyView(self.drawNode(rootNode))
        }
        
        if rootStack.orientation == .vertical {
            return AnyView (
                VStack(spacing: 0) {
                    ForEach(rootNode.children, id: \.id) { child in
                        self.drawNode(child)
                    }
                }
            )
        } else {
            return AnyView (
                HStack(spacing: 0) {
                    ForEach(rootNode.children, id: \.id) { child in
                        self.drawNode(child)
                    }
                }
            )
        }
    }
    
    func drawNode(_ node: Node) -> some View {
        var myView = AnyView(StripeView(stripe: Stripe(color: .gray)))
        
        if let stripe = node.value as? Stripe {
            myView =  AnyView(stripe.color)
        } else if let stack = node.value as? Stack {
            if stack.orientation == .vertical {
                myView =  AnyView (
                    VStack(spacing: 0) {
                        ForEach(node.children, id: \.id) { child in
                            self.drawNode(child)
                        }
                    }
                )
            } else {
                myView = AnyView (
                    HStack(spacing: 0) {
                        ForEach(node.children, id: \.id) { child in
                            self.drawNode(child)
                        }
                    }
                )
            }
        }
        return myView
    }
}
