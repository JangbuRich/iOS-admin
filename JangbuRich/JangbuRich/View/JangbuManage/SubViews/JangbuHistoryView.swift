//
//  JangbuHistoryView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import SwiftUI

struct JangbuHistoryView: View {
    
    var jangbHistory: JangbuHistory
    
    var body: some View {
        VStack {
            HStack {
                Text(jangbHistory.jangbuNumber)
                    .frame(maxWidth: scaledWidth(49), alignment: .leading)
                
                Text(jangbHistory.jangbuDate)
                    .frame(maxWidth: scaledWidth(115), alignment: .leading)
                
                Text(jangbHistory.jangbuGroupName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(jangbHistory.price)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(.label2)
            .foregroundStyle(.jgray50)
        }
    }
}
