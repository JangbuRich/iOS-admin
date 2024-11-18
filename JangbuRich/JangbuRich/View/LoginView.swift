//
//  LoginView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var navigationPathManager: NavigationPathManager
    
    var body: some View {
        NavigationStack(path: $navigationPathManager.path) {
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
                
                Image(.login)
                    .resizable()
                    .scaledToFit()
                    .frame(height: scaledHeight(360))
                .padding(.top, scaledHeight(150))
                
                Spacer()
                
                NavigationLink(value: "") {
                    Image(.buttonKakao)
                        .resizable()
                        .scaledToFit()
                        .frame(height: scaledHeight(48))
                }
                .navigationDestination(for: String.self) { _ in
                    OnboardingFirstView()
                }
                .padding(.bottom, scaledHeight(40))
            }
        }
    }
}

#Preview {
    LoginView()
}
