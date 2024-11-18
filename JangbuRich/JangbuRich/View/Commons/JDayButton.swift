//
//  JDayButton.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct JDayButton: View {
    let day: String
    var isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(day)
                .font(.label1)
                .foregroundStyle(isSelected ? .jgray100  : .jgray60)
                .padding(.horizontal, scaledWidth(15))
                .padding(.vertical, scaledHeight(9))
                .background(isSelected ? .jOrange : .jgray95)
                .cornerRadius(scaledWidth(12))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

