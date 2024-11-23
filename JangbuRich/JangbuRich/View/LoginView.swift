//
//  LoginView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authStore: AuthStore
    
    @State private var isSuccessLogin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(.jAppLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: scaledHeight(120))
                    .padding(.top, scaledHeight(276))
                
                Text("소상공인과 소비자를 위한\n손쉬운 장부 관리의 시작!")
                    .font(.body8)
                    .foregroundStyle(.jgray30)
                    .multilineTextAlignment(.center)
                    .padding(.top, scaledHeight(25))
                
                LottieView(animationName: "Login ani 1", loopMode: .loop)
                    .frame(width: scaledWidth(517), height: scaledHeight(365))
                    .padding(.top, scaledHeight(40))
                
                Spacer()
                
                Button {
                    authStore.kakaoSocialLogin { result in
                        if result == .already {
                            isSuccessLogin = true
                            authStore.isFinishedOnboarding = true
                        } else if result == .success {
                            isSuccessLogin = true
                        }
                    }
                } label: {
                    Image(.buttonKakao)
                        .resizable()
                        .scaledToFit()
                        .frame(height: scaledHeight(48))
                }
                .navigationDestination(isPresented: $isSuccessLogin, destination: {
                    OnboardingFirstView(isSuccessLogin: $isSuccessLogin)
                })
                .padding(.bottom, scaledHeight(40))
            }
        }
    }
}

#Preview {
    LoginView()
}
