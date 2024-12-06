//
//  JHalfCircle.swift
//  JangbuRich
//
//  Created by 변상우 on 12/7/24.
//

import SwiftUI

struct JHalfCircle: View {
    var color: Color
    var isLeftSide: Bool
    
    var body: some View {
        Circle()
            .fill(color)
            .mask(
                GeometryReader { geometry in
                    Rectangle()
                        .frame(width: geometry.size.width / 2, height: geometry.size.height)
                        .offset(x: isLeftSide ? 0 : geometry.size.width / 2)
                }
            )
    }
}
