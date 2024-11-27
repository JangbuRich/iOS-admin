//
//  TodayOrderDetailView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/21/24.
//

import SwiftUI

struct TodayOrderDetailView: View {
    
    @EnvironmentObject var todayOrderStore: TodayOrderStore
    
    @AppStorage("isSimpleMode") var isSimpleMode: Bool = false
    
    var order: TodayOrderList
    var isToday: Bool
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: scaledWidth(8))
                    .stroke(lineWidth: scaledWidth(2))
                    .fill(isToday ? .jOrange : .jgray50)
                
                Text("\(order.id)")
                    .font(isSimpleMode ? .headline2 : .body2)
                    .foregroundStyle(isToday ? .jOrange : .jgray50)
            }
            .background(isToday ? .jgray100 : .jgray90)
            .frame(width: scaledWidth(40), height: scaledHeight(40))
            
            VStack(alignment: .leading) {
                Text(order.menuNames)
                    .font(isSimpleMode ? .headline5 : .body2)
                    .foregroundStyle(isToday ? .jgray30 : .jgray40)
                
                Spacer()
                
                Text("총 \(order.count)개")
                    .font(isSimpleMode ? .label1 : .label3)
                    .foregroundStyle(.jgray50)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("\(formatDate(order.date))")
                    .font(isSimpleMode ? .label2 : .label3)
                    .foregroundStyle(.jgray50)
                
                Spacer()
                
                Text("\(order.price)원")
                    .font(isSimpleMode ? .headline4 : .label1)
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
    }
}
