//
//  JangbuManageView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI

struct JangbuManageView: View {
    
//    @State private var groupList: [JangbuGroup] = []
//    @State private var historyList: [JangbuHistory] = []
    
    let groupList: [JangbuGroup] = [
        JangbuGroup(groupName: "미르미 그룹1", groupDescription: "33기 구름톤 유니브 팀의 장부입니다!", groupPeriod: "2024.11.23 ~ 2024.12.31", groupRemainPrice: "350,000원"),
        JangbuGroup(groupName: "미르미 그룹2", groupDescription: "33기 구름톤 유니브 팀의 장부입니다!", groupPeriod: "2024.11.23 ~ 2024.12.31", groupRemainPrice: "350,000원"),
        JangbuGroup(groupName: "미르미 그룹3", groupDescription: "33기 구름톤 유니브 팀의 장부입니다!", groupPeriod: "2024.11.23 ~ 2024.12.31", groupRemainPrice: "350,000원"),
        JangbuGroup(groupName: "미르미 그룹4", groupDescription: "33기 구름톤 유니브 팀의 장부입니다!", groupPeriod: "2024.11.23 ~ 2024.12.31", groupRemainPrice: "350,000원"),
        JangbuGroup(groupName: "미르미 그룹5", groupDescription: "33기 구름톤 유니브 팀의 장부입니다!", groupPeriod: "2024.11.23 ~ 2024.12.31", groupRemainPrice: "350,000원"),
        JangbuGroup(groupName: "미르미 그룹6", groupDescription: "33기 구름톤 유니브 팀의 장부입니다!", groupPeriod: "2024.11.23 ~ 2024.12.31", groupRemainPrice: "350,000원"),
        JangbuGroup(groupName: "미르미 그룹7", groupDescription: "33기 구름톤 유니브 팀의 장부입니다!", groupPeriod: "2024.11.23 ~ 2024.12.31", groupRemainPrice: "350,000원"),
    ]
    
    let historyList: [JangbuHistory] = [
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
        JangbuHistory(jangbuNumber: "5", jangbuDate: "2024.11.20", jangbuGroupName: "미르미 그룹", price: "+ 100,000원"),
    ]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        HStack {
                            Image(.iconManageJangbu)
                                .resizable()
                                .scaledToFit()
                                .frame(height: scaledHeight(24))
                            
                            Text("장부 관리")
                                .font(.headline6)
                                .foregroundStyle(.jgray20)
                            
                            Spacer()
                        }
                        .padding(.top, scaledHeight(80))
                        .padding(.bottom, scaledHeight(20))
                    }
                    
                    VStack {
                        NavigationLink {
                            JangbuGroupListView(groupList: groupList)
                        } label: {
                            HStack(spacing: 0) {
                                Text("결제 그룹")
                                    .font(.headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Image(.iconRight)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: scaledHeight(24))
                                
                                Spacer()
                            }
                        }
                        .padding(.bottom, scaledHeight(15))
                        
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(groupList.prefix(4), id: \.groupName) { group in
                                JangbuGroupView(jangbuGroup: group)
                            }
                        }
                    }
                    .padding(.bottom, scaledHeight(30))
                    
                    VStack {
                        NavigationLink {
                            JangbuHistoryListView(historyList: historyList)
                        } label: {
                            HStack(spacing: 0) {
                                Text("결제 내역")
                                    .font(.headline4)
                                    .foregroundStyle(.jgray20)
                                
                                Image(.iconRight)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: scaledHeight(24))
                                
                                Spacer()
                            }
                        }
                        .padding(.bottom, scaledHeight(15))
                        
                        VStack {
                            HStack {
                                Text("#")
                                    .frame(maxWidth: scaledWidth(49), alignment: .leading)
                                
                                Text("날짜")
                                    .frame(maxWidth: scaledWidth(115), alignment: .leading)
                                
                                Text("그룹원")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("결제 금액")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .font(.body2)
                            .foregroundStyle(.jgray30)
                            
                            Rectangle()
                                .fill(.jgray80)
                                .frame(height: scaledHeight(1))
                                .padding(.vertical, scaledHeight(15))
                            
                            VStack(spacing: scaledHeight(20)) {
                                ForEach(historyList.prefix(10), id: \.jangbuNumber) { history in
                                    JangbuHistoryView(jangbHistory: history)
                                }
                            }
                        }
                        .padding(scaledWidth(20))
                        .background(.jgray100)
                        .cornerRadius(scaledWidth(10))
                    }
                    .padding(.bottom, scaledHeight(92))
                }
                .padding(.leading, scaledWidth(44))
                .padding(.trailing, scaledWidth(45))
            }
            .scrollIndicators(.hidden)
            .background(.jgray95)
        }
    }
}

#Preview {
    JangbuManageView()
}
