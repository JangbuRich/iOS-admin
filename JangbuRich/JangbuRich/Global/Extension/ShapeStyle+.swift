//
//  ShapeStyle+.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    
    // Main Color
    static var jOrange: Self { .init(hex: "#FF7048") }
    static var jsubYellow: Self { .init(hex: "#FFD400") }
    static var jsubPYellow: Self { .init(hex: "#FFF1B8") }
    static var jsubBlue: Self { .init(hex: "#89C2FF") }
    static var jstatusG: Self { .init(hex: "#00BF40") }
    static var jstatusR: Self { .init(hex: "#FF4242") }
    
    // Gray Scale
    static var jgray10: Self { .init(hex: "#171719") }
    static var jgray20: Self { .init(hex: "#21232A") }
    static var jgray30: Self { .init(hex: "#353C49") }
    static var jgray40: Self { .init(hex: "#585E70") }
    static var jgray50: Self { .init(hex: "#71788C") }
    static var jgray60: Self { .init(hex: "#A4ADBE") }
    static var jgray70: Self { .init(hex: "#D2D6DE") }
    static var jgray80: Self { .init(hex: "#E2E5EB") }
    static var jgray90: Self { .init(hex: "#EFF1F5") }
    static var jgray95: Self { .init(hex: "#F7F8FB") }
    static var jgray100: Self { .init(hex: "#FFFFFF") }
}
