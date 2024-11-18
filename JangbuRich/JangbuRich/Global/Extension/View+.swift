//
//  View+.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

extension View {
    
    // 기준 사이즈 (820 x 1180)
    private var referenceWidth: CGFloat { 820 }
    private var referenceHeight: CGFloat { 1180 }

    // 현재 화면 너비 비율로 스케일링
    func scaledWidth(_ value: CGFloat) -> CGFloat {
        UIScreen.main.bounds.width / referenceWidth * value
    }

    // 현재 화면 높이 비율로 스케일링
    func scaledHeight(_ value: CGFloat) -> CGFloat {
        UIScreen.main.bounds.height / referenceHeight * value
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    // 커스텀 네비게이션바
    func customNavigationBar(title: String, onClose: @escaping () -> Void) -> some View {
        self
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                // 왼쪽 뒤로가기 버튼
                ToolbarItem(placement: .navigationBarLeading) {
                    JBackButton()
                }
                
                // 오른쪽 닫기 버튼
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        onClose()
                    } label: {
                        Image(.iconX)
                            .resizable()
                            .scaledToFit()
                            .frame(width: scaledWidth(24), height: scaledHeight(24))
                    }
                }
            }
    }
}

