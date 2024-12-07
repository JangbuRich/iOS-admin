//
//  LaunchView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var authStore: AuthStore
    
    @AppStorage("isGuidedSimpleMode") var isGuidedSimpleMode: Bool = false
    
    @State private var isActive = false
    @State private var isLoading = true
    
    var body: some View {
        if isActive {
            if authStore.isHavingToken && authStore.isFinishedOnboarding {
                MainTapView()
            } else {
                LoginView()
            }
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
                            
                            isGuidedSimpleMode = false
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
