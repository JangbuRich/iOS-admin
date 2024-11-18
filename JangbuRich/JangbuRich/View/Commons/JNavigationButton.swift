//
//  JNavigationButton.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct JNavigationButton<Destination: View>: View {
    let destination: Destination
    let label: String
    let isEnabled: Bool

    var body: some View {
        NavigationLink(destination: destination) {
            Text(label)
                .font(.label1)
                .foregroundStyle(isEnabled ? .jgray100 : .jgray20)
                .frame(maxWidth: .infinity)
                .frame(height: scaledHeight(48))
                .cornerRadius(scaledHeight(10))
                .background(
                    RoundedRectangle(cornerRadius: scaledHeight(10))
                        .fill(isEnabled ? .jgray20 : .jgray80)
                )
        }
        .disabled(!isEnabled)
    }
}

