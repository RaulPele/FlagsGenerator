//
//  AddSubsectionView.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 08.08.2022.
//

import SwiftUI

struct AddSubsectionView: View {
    @EnvironmentObject private var flagViewModel: FlagViewModel
    
    var body: some View {
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
    }
}

struct AddSubsectionView_Previews: PreviewProvider {
    static var previews: some View {
        AddSubsectionView()
    }
}
