//
//  OverlayManager.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import SwiftUI

class OverlayManager: ObservableObject {
    
    @Published var isSheetPresented: Bool = false
    @Published var sheetContent: AnyView? = nil
    @Published var offsetY: CGFloat = UIScreen.main.bounds.height
        
    func showSheet<Content: View>(_ content: Content) {
        sheetContent = AnyView(content)
        offsetY = UIScreen.main.bounds.height
        isSheetPresented = true
        withAnimation(.easeInOut(duration: 0.3)) {
            offsetY = 0
        }
    }
    
    func hideSheet() {
        withAnimation(.easeInOut(duration: 0.3)) {
            offsetY = UIScreen.main.bounds.height
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.isSheetPresented = false
            self.sheetContent = nil
        }
    }
}

struct OverlayContainer: View {
    
    @EnvironmentObject var overlayManager: OverlayManager
    
    @State private var offsetY: CGFloat = UIScreen.main.bounds.height
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            if overlayManager.isSheetPresented, let content = overlayManager.sheetContent {
                Color.jgray10.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        overlayManager.hideSheet()
                    }
                
                VStack {
                    VStack(alignment: .center) {
                        content
                    }
                    .background(.jgray100)
                    .cornerRadius(scaledWidth(10))
                    .offset(y: overlayManager.offsetY)
                }
                .padding(.horizontal, scaledWidth(177))
            }
        }
    }
    
    func hideWithAnimation() {
        isAnimating = true
        withAnimation(.easeInOut(duration: 0.3)) {
            offsetY = UIScreen.main.bounds.height
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            overlayManager.hideSheet()
            offsetY = UIScreen.main.bounds.height
            isAnimating = false
        }
    }
}
