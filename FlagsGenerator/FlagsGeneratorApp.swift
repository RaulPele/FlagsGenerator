//
//  FlagsGeneratorApp.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 27.07.2022.
//

import SwiftUI

@main
struct FlagsGeneratorApp: App {
    @StateObject private var flagViewModel = FlagViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(flagViewModel)
        }
    }
}
