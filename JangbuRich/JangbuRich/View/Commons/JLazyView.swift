//
//  JLazyView.swift
//  JangbuRich
//
//  Created by 변상우 on 12/7/24.
//

import SwiftUI

struct JLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
