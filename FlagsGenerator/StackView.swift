//
//  StackView.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 02.08.2022.
//

import SwiftUI

struct StackView: View {
    let stack: Stack
    
    var body: some View {
        createStackView()
    }
    
    func createStackView() -> some View {
        switch stack.orientation {
        case .vertical:
            return AnyView{
                VStack(spacing: 0) {
                    ForEach(stack.components, id: \.id) { stripe in
                        StripeView(stripe: stripe)
                    }
                }
            }
            
        case .horizontal:
            return AnyView{
                HStack(spacing: 0) {
                    ForEach(stack.components, id: \.id) { stripe in
                        StripeView(stripe: stripe)
                    }
                }
            }
        }
    }
    
}

//struct StackView_Previews: PreviewProvider {
//    static var previews: some View {
//        StackView()
//    }
//}
