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
                FlagView()
                    .frame(height: geometry.size.height * 1/3)

                ControlsView()
                    .frame(maxHeight: geometry.size.height * 2/3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
