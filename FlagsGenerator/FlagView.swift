//
//  FlagView.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 27.07.2022.
//

import SwiftUI

struct FlagView: View {
    @StateObject private var flagViewModel = FlagViewModel(flagDataModel: .mock2())

    
    var body: some View {
        VStack(spacing: 0) {
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
            }

            flagViewModel.createFlag()
            .padding(.horizontal, 85)
            .padding(.vertical, 45)
        }
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView()
    }
}
