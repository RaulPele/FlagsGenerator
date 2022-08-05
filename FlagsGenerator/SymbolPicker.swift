//
//  SymbolPicker.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 05.08.2022.
//

import SwiftUI


struct EmblemPicker: View {
    private static let symbols: [String] = {
        guard let path = Bundle.main.path(forResource: "sfsymbols", ofType: "txt"),
                let content = try? String(contentsOfFile: path)
           else {
               return []
           }
           return content
               .split(separator: "\n")
               .map { String($0) }
    }()
    var body: some View {
        Text("asd")
    }
}

struct EmblemPicker_Previews: PreviewProvider {
    static var previews: some View {
        EmblemPicker()
    }
}
