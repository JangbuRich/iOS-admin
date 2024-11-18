//
//  JTagButton.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct JTagButton: View {
    let tag: String
    var isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(tag)
                .font(.label1)
                .foregroundStyle(isSelected ? .jgray100  : .jgray60)
                .padding(.horizontal, scaledWidth(15))
                .padding(.vertical, scaledHeight(5))
                .background(isSelected ? .jOrange : .jgray95)
                .cornerRadius(scaledWidth(30))
        }
        .buttonStyle(PlainButtonStyle())
    }
}
