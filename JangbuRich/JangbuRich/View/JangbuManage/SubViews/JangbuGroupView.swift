//
//  JangbuGroupView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import SwiftUI

struct JangbuGroupView: View {
    
    @AppStorage("isSimpleMode") var isSimpleMode: Bool = false
    
    var jangbuGroup: PaymentGroup
    
    var body: some View {
        VStack(spacing: scaledHeight(20)) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(jangbuGroup.teamName)
                        .font(isSimpleMode ? .headline3 : .detail2)
                        .foregroundStyle(.jgray20)
                    
                    Image(.iconRight)
                        .resizable()
                        .scaledToFit()
                        .frame(height: scaledHeight(24))
                    
                    Spacer()
                }
                
                HStack {
                    Text(jangbuGroup.teamDescription)
                        .font(isSimpleMode ? .label1 : .label3)
                        .foregroundStyle(.jgray60)
                    
                    Spacer()
                }
            }
            
            Rectangle()
                .fill(.jgray90)
                .frame(height: scaledHeight(1))
            
            VStack(spacing: scaledHeight(5)) {
                HStack {
                    Text("기간")
                        .font(isSimpleMode ? .label1 : .label3)
                        .foregroundStyle(.jgray60)
                    
                    Spacer()
                    
                    Text(jangbuGroup.period)
                        .font(isSimpleMode ? .headline4 : .body5)
                        .foregroundStyle(.jgray30)
                }
                
                HStack {
                    Text("잔여금액")
                        .font(isSimpleMode ? .label1 : .label3)
                        .foregroundStyle(.jgray60)
                    
                    Spacer()
                    
                    Text("\(jangbuGroup.remainPoint)원")
                        .font(isSimpleMode ? .headline4 : .body5)
                        .foregroundStyle(.jgray30)
                }
            }
        }
        .padding(20)
        .background(.jgray100)
        .cornerRadius(scaledWidth(10))
    }
}
