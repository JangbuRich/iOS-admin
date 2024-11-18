//
//  JTextField.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct JTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    let isRequired: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: scaledHeight(10)) {
            HStack(spacing: 0) {
                Text(title)
                    .font(.headline4)
                    .foregroundStyle(.jgray20)
                
                if isRequired {
                    Text("*")
                        .font(.body6)
                        .foregroundStyle(.jOrange)
                }
            }
            
            TextField(placeholder, text: $text)
                .font(.detail1)
                .foregroundStyle(.jgray60)
                .padding()
                .frame(height: scaledHeight(42))
                .background(.jgray95)
                .cornerRadius(scaledHeight(10))
        }
    }
}
