//
//  JangbuGroupDetailView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import SwiftUI

struct JangbuGroupDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var jangbuStore: JangbuStore
    
    let teamID: String
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: scaledWidth(10)) {
                            Image(.iconBackBlack)
                                .resizable()
                                .scaledToFit()
                                .frame(height: scaledHeight(24))
                            
                            Text("결제 그룹")
                                .font(.headline6)
                                .foregroundStyle(.jgray20)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, scaledHeight(80))
                .padding(.bottom, scaledHeight(20))
                
                VStack(spacing: scaledHeight(25)) {
                    HStack {
                        VStack(alignment: .leading, spacing: scaledHeight(10)) {
                            Text(jangbuStore.groupDetail.teamName)
                                .font(.detail2)
                                .foregroundStyle(.jgray20)
                            
                            Text("3기 구름톤 유니브 팀의 장부입니다!")
                                .font(.label3)
                                .foregroundStyle(.jgray60)
                        }
                        
                        Spacer()
                        
                        Rectangle()
                            .fill(.jgray80)
                            .frame(width: scaledWidth(1))
                            .padding(.horizontal, scaledWidth(20))
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("남은 선결제 금액")
                                .font(.detail6)
                                .foregroundStyle(.jgray40)
                            
                            Text("\(jangbuStore.groupDetail.remainPoint)")
                                .font(.headline2)
                                .foregroundStyle(.jgray20)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("전체 선결제 금액")
                                .font(.detail6)
                                .foregroundStyle(.jgray40)
                            
                            Text("\(jangbuStore.groupDetail.point)")
                                .font(.headline2)
                                .foregroundStyle(.jgray20)
                        }
                        
                        Spacer()
                    }
                    
                    Rectangle()
                        .fill(.jgray80)
                        .frame(height: scaledHeight(1))
                    
                    VStack(spacing: scaledHeight(10)) {
                        HStack {
                            Text("그룹장")
                                .font(.label1)
                                .foregroundStyle(.jgray20)
                            
                            Spacer()
                        }
                        
                        HStack(spacing: scaledWidth(15)) {
                            Image(.aiHelperButton)
                                .resizable()
                                .scaledToFit()
                                .frame(height: scaledHeight(45))
                            
                            Text(jangbuStore.groupDetail.teamLeaderName)
                                .font(.label1)
                                .foregroundStyle(.jgray20)
                            
                            Text(jangbuStore.groupDetail.teamLeaderPhoneNum ?? "010-1234-5678")
                                .font(.label1)
                                .foregroundStyle(.jgray50)
                            
                            Spacer()
                        }
                    }
                }
                .padding(20)
                .background(.jgray100)
                .cornerRadius(scaledWidth(10))
                .padding(.bottom, scaledHeight(20))
                
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
                        ForEach(jangbuStore.groupDetail.historyResponses, id: \.date) { history in
                            JangbuDetailHistoryView(jangbuDetailHistory: history)
                        }
                    }
                }
                .padding(scaledWidth(20))
                .background(.jgray100)
                .cornerRadius(scaledWidth(10))
            }
            .padding(.leading, scaledWidth(44))
            .padding(.trailing, scaledWidth(45))
        }
        .navigationBarBackButtonHidden(true)
        .scrollIndicators(.hidden)
        .background(.jgray95)
        .onAppear {
            jangbuStore.getPaymentGroupDetail(teamId: teamID)
        }
    }
}
