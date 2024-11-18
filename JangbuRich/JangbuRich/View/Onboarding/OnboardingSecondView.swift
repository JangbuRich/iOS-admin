//
//  OnboardingSecondView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct OnboardingSecondView: View {
    
    @EnvironmentObject var navigationPathManager: NavigationPathManager
    
    @State private var isChecked1 = false
    @State private var isChecked2 = false
    @State private var isChecked3 = false
    @State private var isChecked4 = false
    @State private var isChecked5 = false
    
    private var isAllChecked: Bool {
        return isChecked1 && isChecked2 && isChecked3 && isChecked4 && isChecked5
    }
    
    private var isAllRequiredChecked: Bool {
        return isChecked1 && isChecked2 && isChecked3 ? true : false
    }
    
    var body: some View {
        VStack {
            Text("서비스 이용을 위한 약관 동의가 필요해요")
                .font(.headline1)
                .foregroundStyle(.jgray20)
                .padding(.top, scaledHeight(61))
            
            VStack {
                Button {
                    allAgreementToggle()
                } label: {
                    HStack(spacing: scaledHeight(10)) {
                        Image(isAllChecked ? .checkAllButtonFill : .checkAllButton)
                            .resizable()
                            .scaledToFit()
                            .frame(height: scaledHeight(24))
                        
                        Text("전체 동의")
                            .font(.detail2)
                            .foregroundStyle(.jgray20)
                        
                        Spacer()
                    }
                }
                
                Divider()
                    .frame(height: scaledHeight(1))
                    .background(.jgray90)
                    .padding(.vertical, scaledHeight(20))
                    
                
                VStack(spacing: scaledHeight(20)) {
                    JAgreementRowView(title: "[필수] 장부리치 이용약관", isRequired: true, isChecked: $isChecked1) {
                        print("$isChecked1")
                    }
                    
                    JAgreementRowView(title: "[필수] 개인정보 수집 및 이용 동의", isRequired: true, isChecked: $isChecked2) {
                        print("$isChecked2")
                    }
                    
                    JAgreementRowView(title: "[필수] 위치기반서비스 이용 약관", isRequired: true, isChecked: $isChecked3) {
                        print("$isChecked3")
                    }
                    
                    JAgreementRowView(title: "[선택] 마케팅 활용 동의", isRequired: false, isChecked: $isChecked4) {
                        print("$isChecked4")
                    }
                    
                    JAgreementRowView(title: "[선택] 광고성 정보 수신 동의", isRequired: false, isChecked: $isChecked5) {
                        print("$isChecked5")
                    }
                }
            }
            .padding(.top, scaledHeight(100))
            .padding(.horizontal, scaledWidth(170))
            
            Spacer()
            
            JNavigationButton(destination: OnboardingThirdView(), label: "다음", isEnabled: isAllRequiredChecked)
                .padding(.horizontal, scaledWidth(210))
                .padding(.bottom, scaledHeight(40))
        }
        .customNavigationBar(title: "") {
            navigationPathManager.resetToRoot()
        }
    }
    
    func allAgreementToggle() {
        let newValue = !isAllChecked
        isChecked1 = newValue
        isChecked2 = newValue
        isChecked3 = newValue
        isChecked4 = newValue
        isChecked5 = newValue
    }
}

#Preview {
    OnboardingSecondView()
}
