//
//  MenuItemView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/18/24.
//

import SwiftUI

struct MenuItemView: View {
    var image: Image
    var item: MenuCreateRequestDTO
    var isFirstItem: Bool = false
    
    var body: some View {
        HStack(spacing: scaledWidth(15)) {
            image
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
                    
                    Text(item.name)
                        .font(.body2)
                        .foregroundStyle(.jgray30)
                        .padding(.leading, scaledWidth(5))
                    
                    Spacer()
                }
                
                Text(item.description)
                    .font(.body3)
                    .foregroundStyle(.jgray50)
                    .padding(.top, scaledHeight(8))
                
                Text("\(item.price)원")
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
