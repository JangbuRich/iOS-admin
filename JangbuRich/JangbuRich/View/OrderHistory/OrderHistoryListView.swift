//
//  OrderHistoryListView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import SwiftUI

struct OrderHistoryListView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var overlayManager: OverlayManager
    @EnvironmentObject var todayOrderStore: TodayOrderStore
    
    @AppStorage("isSimpleMode") var isSimpleMode: Bool = false
    
    @State private var searchText: String = ""
    
    var isToday: Bool
    
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
                                .font(isSimpleMode ? .headline1 : .headline6)
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
                                .font(isSimpleMode ? .headline3 : .label1)
                                .foregroundStyle(.jgray20)
                                .padding()
                                .frame(width: scaledWidth(320), height: isSimpleMode ? scaledHeight(50) : scaledHeight(44))
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
                    if isToday {
                        Text("총 \(todayOrderStore.todayOrderList.count)건")
                            .font(isSimpleMode ? .headline4 : .detail1)
                            .foregroundStyle(.jgray50)
                    } else {
                        Text("총 \(todayOrderStore.pastOrderList.count)건")
                            .font(isSimpleMode ? .headline4 : .detail1)
                            .foregroundStyle(.jgray50)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Text("최신순")
                            .font(isSimpleMode ? .headline4 : .detail1)
                            .foregroundStyle(.jgray30)
                        
                        Image(.iconDropdown)
                            .resizable()
                            .scaledToFit()
                            .frame(height: scaledHeight(24))
                    }
                }
                .padding(.bottom, scaledHeight(25))
                
                VStack(spacing: scaledHeight(10)) {
                    if isToday {
                        ForEach(todayOrderStore.todayOrderList, id: \.id) { order in
                            HStack {
                                TodayOrderDetailView(order: order, isToday: isToday)
                                
                                Image(.iconRight)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: scaledHeight(24))
                                
                            }
                            .padding(.vertical, scaledHeight(20))
                            .padding(.horizontal, scaledHeight(25))
                            .background(.jgray100)
                            .cornerRadius(scaledWidth(10))
                            .onTapGesture {
                                todayOrderStore.getOrderDetail(orderId: order.id) { result in
                                    if result {
                                        overlayManager.showSheet(
                                            OrderDetailPopupView(orderDetail: todayOrderStore.orderDetailResult)
                                        )
                                    }
                                }
                            }
                        }
                    } else {
                        ForEach(todayOrderStore.pastOrderList, id: \.id) { order in
                            HStack {
                                PastOrderDetailView(order: order, isToday: isToday)
                            }
                            .padding(.vertical, scaledHeight(20))
                            .padding(.horizontal, scaledHeight(25))
                            .background(.jgray100)
                            .cornerRadius(scaledWidth(10))
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
