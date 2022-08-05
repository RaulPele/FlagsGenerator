//
//  FlagView.swift
//  FlagsGenerator
//
//  Created by Raul Pele on 27.07.2022.
//

import SwiftUI

struct FlagView: View {
    @EnvironmentObject private var flagViewModel: FlagViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack {
                    Spacer()

                    Button {
                        saveFlag(AnyView(flagViewModel.createFlag()))
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
    
    func saveFlag(_ flagView: AnyView) {
        let flagImage = flagView.asUiImage()
        print(flagImage)
        UIImageWriteToSavedPhotosAlbum(flagImage, nil, nil, nil)
    }
    
}

extension View {
    func asUiImage() -> UIImage {
        var uiImage = UIImage(systemName: "exclamationmark.triangle.fill")!
        let controller = UIHostingController(rootView: self)
       
        if let view = controller.view {
            let contentSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
            view.bounds = CGRect(origin: .zero, size: contentSize)
//            view.backgroundColor = .clear

            let renderer = UIGraphicsImageRenderer(size: contentSize)
            uiImage = renderer.image { _ in
                view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
            }
        }
        return uiImage
    }
}



struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView()
    }
}
