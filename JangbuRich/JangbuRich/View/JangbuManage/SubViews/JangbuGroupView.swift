//
//  JangbuGroupView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import SwiftUI

struct JangbuGroupView: View {
    
    var jangbuGroup: PaymentGroup
    
    var body: some View {
        VStack(spacing: scaledHeight(20)) {
            VStack(spacing: 0) {
                NavigationLink {
                    JangbuGroupDetailView(teamID: String(jangbuGroup.teamId))
                } label: {
                    HStack(spacing: 0) {
                        Text(jangbuGroup.teamName)
                            .font(.detail2)
                            .foregroundStyle(.jgray20)
                        
                        Image(.iconRight)
                            .resizable()
                            .scaledToFit()
                            .frame(height: scaledHeight(24))
                        
                        Spacer()
                    }
                }
                
                HStack {
                    Text(jangbuGroup.teamDescription)
                        .font(.label3)
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
                        .font(.label3)
                        .foregroundStyle(.jgray60)
                    
                    Spacer()
                    
                    Text(jangbuGroup.period)
                        .font(.body5)
                        .foregroundStyle(.jgray30)
                }
                
                HStack {
                    Text("잔여금액")
                        .font(.label3)
                        .foregroundStyle(.jgray60)
                    
                    Spacer()
                    
                    Text("\(jangbuGroup.remainPoint)원")
                        .font(.body5)
                        .foregroundStyle(.jgray30)
                }
            }
        }
        .padding(20)
        .background(.jgray100)
        .cornerRadius(scaledWidth(10))
    }
}
