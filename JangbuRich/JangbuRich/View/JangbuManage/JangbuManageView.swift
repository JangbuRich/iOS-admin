//
//  JangbuManageView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI

struct JangbuManageView: View {
    
    @EnvironmentObject var jangbuStore: JangbuStore
    
    @AppStorage("isSimpleMode") var isSimpleMode: Bool = false
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        HStack {
                            Spacer()
                            
                            Image(.imageJangbuCharacter)
                                .resizable()
                                .scaledToFit()
                                .frame(height: scaledHeight(91))
                        }
                        
                        Spacer()
                    }
                    .zIndex(1)
                    .padding(.top, scaledHeight(90))
                    .padding(.leading, scaledWidth(44))
                    .padding(.trailing, scaledWidth(74))
                    
                    VStack {
                        VStack {
                            HStack {
                                Image(.iconManageJangbu)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: isSimpleMode ? scaledHeight(30) : scaledHeight(24))
                                
                                Text("장부 관리")
                                    .font(isSimpleMode ? .headline1 : .headline6)
                                    .foregroundStyle(.jgray20)
                                
                                Spacer()
                            }
                            .padding(.top, scaledHeight(80))
                            .padding(.bottom, scaledHeight(20))
                        }
                        
                        VStack {
                            NavigationLink {
                                JangbuGroupListView(groupList: jangbuStore.groupList)
                            } label: {
                                HStack(spacing: 0) {
                                    Text("결제 그룹")
                                        .font(isSimpleMode ? .headline1 : .headline4)
                                        .foregroundStyle(.jgray20)
                                    
                                    Image(.iconRight)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: isSimpleMode ? scaledHeight(30) : scaledHeight(24))
                                    
                                    Spacer()
                                }
                            }
                            .padding(.bottom, scaledHeight(15))
                            
                            LazyVGrid(columns: columns, spacing: 15) {
                                ForEach(jangbuStore.groupList.prefix(4), id: \.id) { group in
                                    JangbuGroupView(jangbuGroup: group)
                                }
                            }
                        }
                        .padding(.bottom, scaledHeight(30))
                        
                        VStack {
                            NavigationLink {
                                JangbuHistoryListView(historyList: jangbuStore.paymentHistoryList)
                            } label: {
                                HStack(spacing: 0) {
                                    Text("결제 내역")
                                        .font(isSimpleMode ? .headline1 : .headline4)
                                        .foregroundStyle(.jgray20)
                                    
                                    Image(.iconRight)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: isSimpleMode ? scaledHeight(30) : scaledHeight(24))
                                    
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
                                .font(isSimpleMode ? .headline4 : .body2)
                                .foregroundStyle(.jgray30)
                                
                                Rectangle()
                                    .fill(.jgray80)
                                    .frame(height: scaledHeight(1))
                                    .padding(.vertical, scaledHeight(15))
                                
                                VStack(spacing: scaledHeight(20)) {
                                    ForEach(jangbuStore.paymentHistoryList.prefix(10), id: \.id) { history in
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
            }
        }
        .scrollIndicators(.hidden)
        .background(.jgray95)
        .onAppear {
            jangbuStore.getPaymentGroup()
            jangbuStore.getPaymentHistory()
        }
    }
}

#Preview {
    JangbuManageView()
}
