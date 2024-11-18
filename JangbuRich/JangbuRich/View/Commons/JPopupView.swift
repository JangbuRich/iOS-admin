//
//  JPopupView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct JPopupView<Content: View>: View {
    
    @Binding var isPresented: Bool
    
    let content: () -> Content
    
    var body: some View {
        ZStack {
            if isPresented {
                Color.jgray10.opacity(0.2)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isPresented = false
                            self.hideKeyboard()
                        }
                    }
            }
            
            VStack {
                content()
            }
            .background(.jgray100)
            .cornerRadius(scaledWidth(10))
            .offset(y: isPresented ? 0 : UIScreen.main.bounds.height)
            .animation(.easeInOut, value: isPresented)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, scaledWidth(177))
            .padding(.vertical, scaledWidth(294))
        }
    }
}
