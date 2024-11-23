//
//  ReservationView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI

struct ReservationView: View {
    var body: some View {
//        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Image(.iconReservation)
                            .resizable()
                            .scaledToFit()
                            .frame(height: scaledHeight(24))
                        
                        Text("예약 관리")
                            .font(.headline6)
                            .foregroundStyle(.jgray20)
                        
                        Spacer()
                    }
                    .padding(.top, scaledHeight(80))
                    .padding(.bottom, scaledHeight(20))
                }
                .padding(.leading, scaledWidth(44))
                .padding(.trailing, scaledWidth(45))
                
                VStack {
                    NavigationLink {
//                        OrderHistoryListView(isToday: true, orderList: todayOrder, orderDetail: orderList)
                    } label: {
                        HStack(spacing: 0) {
                            Text("예약 확인")
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
                }
                .padding(.bottom, scaledHeight(76))
            }
            .scrollIndicators(.hidden)
            .background(.jgray95)
//        }
    }
}

#Preview {
    ReservationView()
}
