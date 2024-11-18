//
//  LaunchView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var isActive = false
    @State private var isLoading = true
    
    var body: some View {
        if isActive {
            LoginView()
        } else {
            if isLoading {
                VStack {
                    Image(.jAppLogo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 120)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation {
                            self.isActive = true
                            self.isLoading.toggle()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LaunchView()
}