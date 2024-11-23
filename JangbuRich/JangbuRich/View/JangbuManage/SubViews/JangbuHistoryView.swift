//
//  JangbuHistoryView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import SwiftUI

struct JangbuHistoryView: View {
    
    var jangbHistory: PaymentHistory
    
    var body: some View {
        VStack {
            HStack {
                Text("\(jangbHistory.id)")
                    .frame(maxWidth: scaledWidth(49), alignment: .leading)
                
                Text(jangbHistory.createdAt)
                    .frame(maxWidth: scaledWidth(115), alignment: .leading)
                
                Text(jangbHistory.teamName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("+ \(jangbHistory.transactionedPoint)원")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(.label2)
            .foregroundStyle(.jgray50)
        }
    }
}
