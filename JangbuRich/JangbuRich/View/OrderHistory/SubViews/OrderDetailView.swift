//
//  OrderDetailView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/21/24.
//

import SwiftUI

struct OrderDetailView: View {
    var order: OrderDetail
    var isToday: Bool
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: scaledWidth(8))
                    .stroke(lineWidth: scaledWidth(2))
                    .fill(isToday ? .jOrange : .jgray50)
                
                Text(order.orderNumber)
                    .font(.body2)
                    .foregroundStyle(isToday ? .jOrange : .jgray50)
            }
            .background(isToday ? .jgray100 : .jgray90)
            .frame(width: scaledWidth(40), height: scaledHeight(40))
            
            VStack(alignment: .leading) {
                Text(order.menuTitle)
                    .font(.body2)
                    .foregroundStyle(isToday ? .jgray30 : .jgray40)
                
                Spacer()
                
                Text(order.numberOfMenu)
                    .font(.label3)
                    .foregroundStyle(.jgray50)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text(order.orderDate)
                    .font(.label3)
                    .foregroundStyle(.jgray50)
                
                Spacer()
                
                Text(order.price)
                    .font(.label1)
                    .foregroundStyle(isToday ? .jgray20 : .jgray40)
            }
        }
        .frame(height: scaledHeight(40))
        
        Divider()
            .frame(height: scaledHeight(1))
            .background(.jgray80)
            .padding(.vertical, scaledHeight(15))
    }
}
