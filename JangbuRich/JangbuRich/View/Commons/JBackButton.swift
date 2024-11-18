//
//  JBackButton.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct JBackButton: View {
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(.iconBack)
                .resizable()
                .scaledToFit()
                .frame(width: scaledWidth(24), height: scaledHeight(24))
        }
    }
}
