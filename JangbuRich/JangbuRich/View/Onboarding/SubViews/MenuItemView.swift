//
//  MenuItemView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct MenuItemView: View {
    var item: MenuItem
    var isFirstItem: Bool = false
    
    var body: some View {
        HStack(spacing: scaledWidth(15)) {
            item.image
                .resizable()
                .scaledToFill()
                .frame(width: scaledWidth(100), height: scaledHeight(100))
                .cornerRadius(scaledWidth(10))
            
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top) {
                    if isFirstItem {
                        Text("대표")
                            .font(.label3)
                            .foregroundStyle(.jgray100)
                            .padding(.vertical, scaledHeight(2))
                            .padding(.horizontal, scaledWidth(10))
                            .background(.jOrange)
                            .cornerRadius(scaledWidth(25))
                    }
                    
                    Text(item.title)
                        .font(.body2)
                        .foregroundStyle(.jgray30)
                        .padding(.leading, scaledWidth(5))
                    
                    Spacer()
                    
                    Button {
                        print("수정! 삭제!")
                    } label: {
                        Image(.iconMore)
                            .resizable()
                            .scaledToFit()
                            .frame(height: scaledHeight(24))
                    }
                }
                
                Text(item.subtitle)
                    .font(.body3)
                    .foregroundStyle(.jgray50)
                    .padding(.top, scaledHeight(8))
                
                Text(item.price)
                    .font(.detail2)
                    .foregroundStyle(.jgray30)
                    .padding(.top, scaledHeight(10))
            }
        }
        .padding(scaledWidth(20))
        .background(.jgray100)
        .cornerRadius(scaledWidth(10))
    }
}
