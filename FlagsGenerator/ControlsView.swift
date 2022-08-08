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
            
            Button {
                flagViewModel.addStripe()
            } label: {
                Text("Add Stripe")
                    .foregroundColor(.white)
                    .font(.system(size: 24).bold())
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .background(Color(red: 0.131, green: 0.573, blue: 0.712))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack() {
                Text("ADD SUBSECTION")
                    .font(.system(size: 12).bold())
                    .foregroundColor(Color(red: 0.131, green: 0.573, blue: 0.712))
                
                HStack {
                    Spacer()
                    
                    //vertical subsection button
                    Button {
                        flagViewModel.addSubsection(orientation: .horizontal)
                    } label: {
                        HStack(spacing: 3) {
                            RoundedRectangle(cornerRadius: 2, style: .circular)
                                .foregroundColor(Color(red: 0.131, green: 0.573, blue: 0.712))
                                .frame(width: 13, height: 30)
                            
                            RoundedRectangle(cornerRadius: 2, style: .circular)
                                .foregroundColor(Color(red: 0.131, green: 0.573, blue: 0.712))
                                .frame(width: 13, height: 30)
                        }
                    }
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(Color(red: 0.865, green: 0.883, blue: 0.88))
                        .frame(width: 1 , height: 51)

                    Spacer()
                    
                    //vertical subsection
                    Button {
                        flagViewModel.addSubsection(orientation: .vertical)

                    } label: {
                        VStack(spacing: 3) {
                            RoundedRectangle(cornerRadius: 2, style: .circular)
                                .foregroundColor(Color(red: 0.131, green: 0.573, blue: 0.712))
                                .frame(width: 29, height: 13)
                            
                            RoundedRectangle(cornerRadius: 2, style: .circular)
                                .foregroundColor(Color(red: 0.131, green: 0.573, blue: 0.712))
                                .frame(width: 29, height: 13)
                        }
                    }
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 3)
            
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
