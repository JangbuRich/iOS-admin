//
//  JangbuGroupView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import SwiftUI

struct JangbuGroupView: View {
    
    var jangbuGroup: JangbuGroup
    
    var body: some View {
        VStack(spacing: scaledHeight(20)) {
            VStack(spacing: 0) {
                NavigationLink {
                    JangbuGroupDetailView()
                } label: {
                    HStack(spacing: 0) {
                        Text(jangbuGroup.groupName)
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
                    Text(jangbuGroup.groupDescription)
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
                    
                    Text(jangbuGroup.groupPeriod)
                        .font(.body5)
                        .foregroundStyle(.jgray30)
                }
                
                HStack {
                    Text("잔여금액")
                        .font(.label3)
                        .foregroundStyle(.jgray60)
                    
                    Spacer()
                    
                    Text(jangbuGroup.groupRemainPrice)
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
