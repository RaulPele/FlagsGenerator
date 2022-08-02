//
//  StripeView.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 02.08.2022.
//

import SwiftUI

struct StripeView: View {
    var stripe: Stripe
    
    var body: some View {
//        Color(red: stripe.red, green: stripe.green, blue: stripe.blue)
//            .opacity(stripe.alpha)
        stripe.color
    }
}


//struct StripeView_Previews: PreviewProvider {
//    static var previews: some View {
//        StripeView()
//    }
//}
