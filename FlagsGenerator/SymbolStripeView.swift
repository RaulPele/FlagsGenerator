//
//  SymbolStripeView.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 08.08.2022.
//

import SwiftUI

struct SymbolStripeView: View {
    var symbolStripe: SymbolStripe
    
    var body: some View {
        ZStack(alignment: .center) {
            symbolStripe.color
            Image(systemName: symbolStripe.symbol)
        }
    }
}

struct SymbolStripeView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolStripeView(symbolStripe: SymbolStripe(color: .blue, symbol: "photo"))
    }
}
