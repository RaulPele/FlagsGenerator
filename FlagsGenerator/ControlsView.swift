//
//  ControlsView.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 27.07.2022.
//

import SwiftUI

struct ControlsView: View {
    @State private var selectedColor = Color(red: 0.98, green: 0.9, blue: 0.2)
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 60) {
                VStack(spacing: 25) {
                    Text("PICK COLOR")
                        .font(.system(size: 12).bold())
                    
                    ColorPicker("", selection: $selectedColor)
                        .scaledToFit()
                        .labelsHidden()
                }
                
                VStack(spacing: 25) {
                    Text("PICK EMBLEM")
                        .font(.system(size: 12).bold())
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color(red: 0.865, green: 0.883, blue: 0.88))
                    }
                    .frame(width: 28.33, height: 28.33)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 3)
            
            Button {
                    
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
                    
                    Button {
                    
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
                    
                    Button {
                        
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
