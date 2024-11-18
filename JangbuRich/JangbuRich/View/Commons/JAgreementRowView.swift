//
//  JAgreementRowView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct JAgreementRowView: View {
    let title: String
    let isRequired: Bool
    @Binding var isChecked: Bool
    let onTap: () -> Void

    var body: some View {
        HStack {
            Button {
                isChecked.toggle()
            } label: {
                HStack(spacing: scaledHeight(10)) {
                    Image(isChecked ? .checkButtonFill : .checkButton)
                        .resizable()
                        .scaledToFit()
                        .frame(height: scaledHeight(24))

                    Text(title)
                        .font(.detail1)
                        .foregroundStyle(.jgray20)
                }
            }
            
            Spacer()
            
            Button {
                onTap()
            } label: {
                Image(.rightArrowButton)
                    .resizable()
                    .scaledToFit()
                    .frame(height: scaledHeight(24))
            }
        }
    }
}
