//
//  OrderHistoryListView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import SwiftUI

struct OrderHistoryListView: View {
    
    @EnvironmentObject var overlayManager: OverlayManager
    @Environment(\.dismiss) private var dismiss
    
    @State private var searchText: String = ""
    
    var isToday: Bool
    let orderList: [OrderDetail]
    var orderDetail: OrderDetailList
    
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
                            
                            Text(isToday ? "오늘의 주문 내역" : "지난 주문 내역")
                                .font(.headline6)
                                .foregroundStyle(.jgray20)
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        HStack {
                            Spacer()
                            
                            Image(.searchButton)
                                .resizable()
                                .scaledToFit()
                                .frame(height: scaledHeight(20))
                                .padding(.trailing, scaledWidth(16))
                        }
                        .zIndex(1)
                        
                        HStack {
                            Spacer()
                            
                            TextField(isToday ? "오늘의 주문 내역을 검색하세요" : "지난 주문 내역을 검색하세요", text: $searchText)
                                .font(.label1)
                                .foregroundStyle(.jgray20)
                                .padding()
                                .frame(width: scaledWidth(320), height: scaledHeight(44))
                                .background(.jgray100)
                                .cornerRadius(scaledHeight(10))
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.jgray70, lineWidth: scaledWidth(1))
                                )
                        }
                    }
                }
                .padding(.top, scaledHeight(80))
                .padding(.bottom, scaledHeight(15))
                
                HStack {
                    Text("총 9건")
                        .font(.detail1)
                        .foregroundStyle(.jgray50)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Text("최신순")
                            .font(.detail1)
                            .foregroundStyle(.jgray30)
                        
                        Image(.iconDropdown)
                            .resizable()
                            .scaledToFit()
                            .frame(height: scaledHeight(24))
                    }
                }
                .padding(.bottom, scaledHeight(25))
                
                VStack(spacing: scaledHeight(10)) {
                    ForEach(orderList, id: \.orderNumber) { order in
                        HStack {
                            OrderDetailView(order: order, isToday: isToday)
                            
                            if isToday {
                                Image(.iconRight)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: scaledHeight(24))
                            }
                        }
                        .padding(.vertical, scaledHeight(20))
                        .padding(.horizontal, scaledHeight(25))
                        .background(.jgray100)
                        .cornerRadius(scaledWidth(10))
                        .onTapGesture {
                            if isToday {
                                overlayManager.showSheet(
                                    OrderDetailPopupView(orderList: orderDetail)
                                )
                            }
                        }
                    }
                }
            }
            .padding(.leading, scaledWidth(44))
            .padding(.trailing, scaledWidth(45))
        }
        .navigationBarBackButtonHidden(true)
        .scrollIndicators(.hidden)
        .background(.jgray95)
    }
}
