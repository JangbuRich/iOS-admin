//
//  JDashedDivider.swift
//  JangbuRich
//
//  Created by 변상우 on 12/7/24.
//

import SwiftUI

struct JDashedDivider: View {
    var color: Color
    var lineWidth: CGFloat
    var dashPattern: [CGFloat] // 점선 패턴 [길이, 간격]
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 0, y: geometry.size.height / 2))
                path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height / 2))
            }
            .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dashPattern))
            .foregroundStyle(color)
        }
        .frame(height: lineWidth)
    }
}
