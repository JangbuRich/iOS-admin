//
//  JLeftTextField.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI

struct JLeftTextField: View {
    
    let unit: String
    let placeholder: String
    var isEditable: Bool = true
    
    @Binding var text: String

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                
                Text(unit)
                    .font(.detail1)
                    .foregroundStyle(.jgray40)
                    .padding(.trailing, scaledWidth(15))
            }
            .zIndex(1)
            
            TextField(placeholder, text: $text)
                .font(.detail1)
                .foregroundStyle(.jgray20)
                .padding()
                .padding(.trailing, scaledWidth(20))
                .multilineTextAlignment(.trailing)
                .keyboardType(.numberPad)
                .frame(height: scaledHeight(42))
                .background(.jgray95)
                .cornerRadius(scaledHeight(10))
                .onChange(of: text) {
                    text = text.filter { $0.isNumber }
                }
                .disabled(!isEditable)
        }
    }
}
