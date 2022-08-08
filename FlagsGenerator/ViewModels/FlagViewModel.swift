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
    @Published var iconPickerPresented = false
    @Published var selectedSymbol = "photo"
    @Published var showErrorAlert = false

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
    
    func addStripe() throws {
        if flagParentIsStack() {
            let stripeNode = createStripeNode()
            flagDataModel.tree.add(child: stripeNode)
            self.objectWillChange.send()
        } else {
            throw AddStripeError.containerNotFound
        }
    }
    
    func createStripeNode() -> Node {
        if selectedSymbol == "photo" {
            return Node(value: Stripe(color: selectedColor))
        } else {
            return Node(value: SymbolStripe(color: selectedColor, symbol: selectedSymbol))
        }
    }
    
    func commitSection() {
        flagDataModel.tree.moveUp()
    }
    
    func flagParentIsStack() -> Bool {
        guard let root = flagDataModel.tree.root else {
            return true
        }
        
        return root.value is Stack
    }
}
