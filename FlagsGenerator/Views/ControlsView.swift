//
//  ControlsView.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 27.07.2022.
//

import SwiftUI
import SymbolPicker

struct ControlsView: View {
    @EnvironmentObject private var flagViewModel: FlagViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            PickersSectionView()
            
            Button {
                do {
                    try flagViewModel.addStripe()
                } catch AddStripeError.containerNotFound {
                    flagViewModel.showErrorAlert = true
                } catch {
                    
                }
            } label: {
                Text("Add Stripe")
                    .foregroundColor(.white)
                    .font(.system(size: 24).bold())
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .background(Color(red: 0.131, green: 0.573, blue: 0.712))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .alert("Can't add stripe", isPresented: $flagViewModel.showErrorAlert) {
                Button(role: .cancel, action: {
                    
                }) {
                    Text("Cancel")
                }
            } message: {
                Text("You must add a subsection first!")
            }
            
            AddSubsectionView()
            
            Button {
                flagViewModel.commitSection()
            } label: {
                Text("Commit section")
                    .foregroundColor(.white)
                    .font(.system(size: 24).bold())
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .background(Color(red: 0.484, green: 0.825, blue: 0.364))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        }
        .padding(20)
        .background(Color(red: 0.865, green: 0.883, blue: 0.88))
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
    }
}
