//
//  JKFImage.swift
//  JangbuRich
//
//  Created by 변상우 on 11/28/24.
//

import SwiftUI

import Kingfisher

struct JKFImage: View {
    let imageUrl: String
    var height: CGFloat

    var body: some View {
        if let url = URL(string: imageUrl) {
            KFImage(url)
                .resizable()
                .scaledToFit()
                .frame(height: scaledHeight(height))
        } else {
            Text("Invalid Image URL")
                .foregroundColor(.gray)
                .frame(width: height, height: height)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
        }
    }
}
