//
//  JDashedDivider.swift
//  JangbuRich
//
//  Created by 변상우 on 12/7/24.
//

import SwiftUI

struct JDashedDivider: View {
    var color: Color = .gray
    var lineWidth: CGFloat = 1
    var dashPattern: [CGFloat] = [5, 5] // 점선 패턴 [길이, 간격]
    
    var body: some View {
        Rectangle()
            .frame(height: lineWidth)
            .foregroundStyle(.clear)
            .overlay(
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dashPattern))
                    .foregroundStyle(color)
            )
            .frame(maxWidth: .infinity)
    }
}
