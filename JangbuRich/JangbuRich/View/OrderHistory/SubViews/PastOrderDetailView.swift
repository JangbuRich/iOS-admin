//
//  PastOrderDetailView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/24/24.
//

import SwiftUI

struct PastOrderDetailView: View {
    
    @EnvironmentObject var todayOrderStore: TodayOrderStore
    
    var order: PastOrderResult
    var isToday: Bool
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: scaledWidth(8))
                    .stroke(lineWidth: scaledWidth(2))
                    .fill(isToday ? .jOrange : .jgray50)
                
                Text("\(order.id)")
                    .font(.body2)
                    .foregroundStyle(isToday ? .jOrange : .jgray50)
            }
            .background(isToday ? .jgray100 : .jgray90)
            .frame(width: scaledWidth(40), height: scaledHeight(40))
            
            VStack(alignment: .leading) {
                Text(order.menuNames)
                    .font(.body2)
                    .foregroundStyle(isToday ? .jgray30 : .jgray40)
                
                Spacer()
                
                Text("총 \(order.count)개")
                    .font(.label3)
                    .foregroundStyle(.jgray50)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("\(order.date)")
                    .font(.label3)
                    .foregroundStyle(.jgray50)
                
                Spacer()
                
                Text("\(order.price)원")
                    .font(.label1)
                    .foregroundStyle(isToday ? .jgray20 : .jgray40)
            }
        }
        .frame(height: scaledHeight(40))
        .onAppear {
            todayOrderStore.getOrderDetail(orderId: order.id) { result in
                if result {
                    
                }
            }
        }
        
        Rectangle()
            .fill(.jgray80)
            .frame(height: scaledHeight(1))
            .padding(.vertical, scaledHeight(15))
    }
}
