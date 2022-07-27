//
//  ContentView.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 27.07.2022.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0){
                //top section
                VStack(spacing: 0) {
                    HStack {
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Save Flag")
                                .padding(.horizontal, 15)
                                .padding(.vertical, 9)
                        }
                        .background(Color(red: 0.131, green: 0.573, blue: 0.712)
                            .opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .padding(.trailing)
                   
                    VStack {
                        FlagView()
                            .padding(.horizontal, 85)
                            .padding(.vertical, 60)
                    }
                    .frame(height: geometry.size.height * 1/3)
                    
                }
                    
                //bottom section
                VStack(spacing: 20) {
                    
                    HStack(spacing: 60) {
                        VStack(spacing: 25) {
                            Text("PICK COLOR")
                                .font(.system(size: 12).bold())
                            
                            Button {
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 2)
                                    .frame(width: 124, height: 30)
                                    .foregroundColor(Color(red: 0.865, green: 0.883, blue: 0.88))
                            }
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
                .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 2/3)
                .background(Color(red: 0.865, green: 0.883, blue: 0.88))
//                .ignoresSafeArea()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
