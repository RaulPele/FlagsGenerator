//
//  PickersSectionView.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 08.08.2022.
//

import SwiftUI

struct PickersSectionView: View {
    @EnvironmentObject private var flagViewModel: FlagViewModel
    
    var body: some View {
        HStack(spacing: 60) {
            VStack(spacing: 25) {
                Text("PICK COLOR")
                    .font(.system(size: 12).bold())
                
                ColorPicker("", selection: $flagViewModel.selectedColor)
                    .scaledToFit()
                    .labelsHidden()
            }
            
            VStack(spacing: 25) {
                Text("PICK EMBLEM")
                    .font(.system(size: 12).bold())
                
                Button {
                    flagViewModel.iconPickerPresented = true
                } label: {
                    Image(systemName: flagViewModel.selectedSymbol)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color(red: 0.865, green: 0.883, blue: 0.88))
                }
                .frame(width: 28.33, height: 28.33)
                .sheet(isPresented: $flagViewModel.iconPickerPresented) {
                    EmblemPicker(symbol: $flagViewModel.selectedSymbol)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 3)
    }
}

struct PickersSectionView_Previews: PreviewProvider {
    static var previews: some View {
        PickersSectionView()
    }
}
