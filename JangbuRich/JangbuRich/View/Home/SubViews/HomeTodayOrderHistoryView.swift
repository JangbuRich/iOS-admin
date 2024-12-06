//
//  HomeTodayOrderHistoryView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/20/24.
//

import SwiftUI

struct HomeTodayOrderHistoryView: View {
    
    @AppStorage("isSimpleMode") var isSimpleMode: Bool = false
    
    var order: TodayOrderList
    
    var body: some View {
        HStack(alignment: .bottom) {
            ZStack {
                RoundedRectangle(cornerRadius: scaledWidth(8))
                    .stroke(lineWidth: scaledWidth(2))
                    .fill(.jOrange)
                
                Text("\(order.id)")
                    .font(isSimpleMode ? .headline2 : .body2)
                    .foregroundStyle(.jOrange)
            }
            .frame(width: scaledWidth(40), height: scaledHeight(40))
            
            VStack(alignment: .leading) {
                Text(order.menuNames)
                    .font(isSimpleMode ? .headline5 : .body2)
                    .foregroundStyle(.jgray30)
                
                Spacer()
                
                Text("총 \(order.count)개")
                    .font(isSimpleMode ? .label1 : .label3)
                    .foregroundStyle(.jgray50)
            }
            
            Spacer()
            
            Text("\(order.price)원")
                .font(isSimpleMode ? .headline3 : .label1)
                .foregroundStyle(.jgray20)
        }
        .frame(height: scaledHeight(40))
    }
}
