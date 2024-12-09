//
//  GuideSimpleModeView.swift
//  JangbuRich
//
//  Created by 변상우 on 12/7/24.
//

import SwiftUI

struct GuideSimpleModeView: View {
    
    @EnvironmentObject var overlayManager: OverlayManager
    
    @AppStorage("isSimpleMode") var isSimpleMode: Bool = false
    
    var body: some View {
        VStack {
            Text("메인 홈 화면 모드를 설정해주세요!")
                .font(.headline7)
                .foregroundStyle(.jgray20)
                .padding(.bottom, scaledHeight(5))
            
            Text("선택하신 화면이 기본 화면이 됩니다.\n추후 홈 화면 상단 또는 마이페이지에서 수정할 수 있습니다.")
                .font(.body4)
                .foregroundStyle(.jgray50)
                .multilineTextAlignment(.center)
                .padding(.bottom, scaledHeight(30))
            
            HStack {
                Button {
                    isSimpleMode = false
                } label: {
                    Text("일반 모드")
                        .font(.headline4)
                        .foregroundStyle(isSimpleMode ? .jgray60 : .jgray20)
                        .padding(.vertical, scaledHeight(16))
                        .frame(maxWidth: .infinity)
                        .background(isSimpleMode ? .clear : .jgray100)
                        .cornerRadius(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(isSimpleMode ? .clear : .jOrange, lineWidth: 2)
                        )
                }
                .padding(.horizontal, scaledWidth(6))

                Button {
                    isSimpleMode = true
                } label: {
                    Text("간편 모드")
                        .font(.headline8)
                        .foregroundStyle(isSimpleMode ? .jgray20 : .jgray60)
                        .padding(.vertical, scaledHeight(16))
                        .frame(maxWidth: .infinity)
                        .background(isSimpleMode ? .jgray100 : .clear)
                        .cornerRadius(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(isSimpleMode ? .jOrange : .clear, lineWidth: 2)
                        )
                }
                .padding(.horizontal, scaledWidth(6))
            }
            .frame(maxWidth: .infinity)
            .frame(height: scaledHeight(80))
            .background(.jgray95)
            .cornerRadius(10)
            .padding(.horizontal, scaledWidth(10))
            .padding(.bottom, scaledHeight(20))
            
            Button {
                overlayManager.hideSheet()
            } label: {
                Text("확인")
                    .font(.headline8)
                    .foregroundStyle(.jgray100)
                    .padding(.horizontal, scaledWidth(185))
                    .padding(.vertical, scaledHeight(12))
                    .background(
                        RoundedRectangle(cornerRadius: scaledHeight(10))
                            .fill(.jgray20)
                    )
            }
        }
        .padding(scaledWidth(20))
    }
}
