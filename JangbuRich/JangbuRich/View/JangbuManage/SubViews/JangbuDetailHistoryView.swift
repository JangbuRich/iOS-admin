//
//  JangbuDetailHistoryView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/27/24.
//

import SwiftUI

struct JangbuDetailHistoryView: View {
    
    @AppStorage("isSimpleMode") var isSimpleMode: Bool = false
    
    var jangbuDetailHistory: JangbuGroupDetailHistory
    
    var body: some View {
        VStack {
            HStack {
                Text("\(jangbuDetailHistory.id)")
                    .frame(maxWidth: scaledWidth(49), alignment: .leading)
                
                Text(jangbuDetailHistory.date)
                    .frame(maxWidth: scaledWidth(115), alignment: .leading)
                
                Text(jangbuDetailHistory.userName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(jangbuDetailHistory.price)원")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(isSimpleMode ? .body9 : .label2)
            .foregroundStyle(.jgray50)
        }
    }
}
