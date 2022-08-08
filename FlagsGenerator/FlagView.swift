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
                        saveFlag(AnyView(createFlag()
                            .ignoresSafeArea()))
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

            createFlag()
                .padding(.horizontal, 85)
                .padding(.vertical, 45)
        }
    }
    
    func saveFlag(_ flagView: AnyView) {
        let flagImage = flagView.asUiImage()
        print(flagImage)
        UIImageWriteToSavedPhotosAlbum(flagImage, nil, nil, nil)
    }
    
    func createFlag() -> some View {
        guard let rootNode = flagViewModel.flagDataModel.tree.root else {
            return AnyView(Color.gray)
        }
        
        guard let rootStack = rootNode.value as? Stack else {
            return AnyView(self.drawNode(rootNode))
        }
        
        if rootStack.orientation == .vertical {
            return AnyView (
                VStack(spacing: 0) {
                    ForEach(rootNode.children, id: \.id) { child in
                        self.drawNode(child)
                    }
                }
            )
        } else {
            return AnyView (
                HStack(spacing: 0) {
                    ForEach(rootNode.children, id: \.id) { child in
                        self.drawNode(child)
                    }
                }
            )
        }
    }
    
    func drawNode(_ node: Node) -> some View {
        var myView = AnyView(StripeView(stripe: Stripe(color: .gray)))
        
        if let stripe = node.value as? Stripe {
            myView =  AnyView(StripeView(stripe: stripe))
        } else if let symbolStripe = node.value as? SymbolStripe {
            myView = AnyView(SymbolStripeView(symbolStripe: symbolStripe))
        } else if let stack = node.value as? Stack {
            if stack.orientation == .vertical {
                myView =  AnyView (
                    VStack(spacing: 0) {
                        ForEach(node.children, id: \.id) { child in
                            self.drawNode(child)
                        }
                    }
                )
            } else {
                myView = AnyView (
                    HStack(spacing: 0) {
                        ForEach(node.children, id: \.id) { child in
                            self.drawNode(child)
                        }
                    }
                )
            }
        }
        return myView
    }
}

extension View {
    func asUiImage() -> UIImage {
        var uiImage = UIImage(systemName: "exclamationmark.triangle.fill")!
        let controller = UIHostingController(rootView: self)
       
        if let view = controller.view {
            let contentSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
            view.bounds = CGRect(origin: .zero, size: contentSize)
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
            .environmentObject(FlagViewModel())
    }
}
