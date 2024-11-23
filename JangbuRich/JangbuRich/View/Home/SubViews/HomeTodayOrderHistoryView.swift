//
//  HomeTodayOrderHistoryView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/20/24.
//

import SwiftUI

struct HomeTodayOrderHistoryView: View {
    var order: TodayOrderHistory
    
    var body: some View {
        HStack(alignment: .bottom) {
            ZStack {
                RoundedRectangle(cornerRadius: scaledWidth(8))
                    .stroke(lineWidth: scaledWidth(2))
                    .fill(.jOrange)
                
                Text(order.orderNumber)
                    .font(.body2)
                    .foregroundStyle(.jOrange)
            }
            .frame(width: scaledWidth(40), height: scaledHeight(40))
            
            VStack(alignment: .leading) {
                Text(order.menuTitle)
                    .font(.body2)
                    .foregroundStyle(.jgray30)
                
                Spacer()
                
                Text(order.numberOfMenu)
                    .font(.label3)
                    .foregroundStyle(.jgray50)
            }
            
            Spacer()
            
            Text(order.price)
                .font(.label1)
                .foregroundStyle(.jgray20)
        }
        .frame(height: scaledHeight(40))
        
        Rectangle()
            .fill(.jgray80)
            .frame(height: scaledHeight(1))
            .padding(.vertical, scaledHeight(15))
    }
}
