//
//  OrderHistoryView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI

struct OrderHistoryView: View {
    
    @EnvironmentObject var overlayManager: OverlayManager
    @EnvironmentObject var todayOrderStore: TodayOrderStore
    
    @AppStorage("isSimpleMode") var isSimpleMode: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Image(.iconOrderHistory)
                            .resizable()
                            .scaledToFit()
                            .frame(height: isSimpleMode ? scaledHeight(30) : scaledHeight(24))
                        
                        Text("주문 내역")
                            .font(isSimpleMode ? .headline1 : .headline6)
                            .foregroundStyle(.jgray20)
                        
                        Spacer()
                    }
                    .padding(.top, scaledHeight(80))
                    .padding(.bottom, scaledHeight(20))
                    
                    VStack {
                        NavigationLink {
                            OrderHistoryListView(isToday: true)
                        } label: {
                            HStack(spacing: 0) {
                                Text("오늘의 주문 내역")
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
                            VStack {
                                HStack(spacing: scaledWidth(10)) {
                                    Image(.iconCoupon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: scaledHeight(34))
                                    
                                    HStack(spacing: scaledWidth(29)) {
                                        VStack {
                                            Text("오늘 총 주문")
                                                .font(isSimpleMode ? .headline3 : .detail2)
                                                .foregroundStyle(.jgray30)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing) {
                                            Text("총 \(todayOrderStore.todayOrderList.count)건")
                                                .font(isSimpleMode ? .label1 : .label3)
                                                .foregroundStyle(.jgray50)
                                            
                                            Text("\(todayOrderStore.todayTotalPrice)원")
                                                .font(isSimpleMode ? .headline6 : .headline2)
                                                .foregroundStyle(.jgray20)
                                        }
                                    }
                                }
                                .padding(.vertical, scaledHeight(25))
                                
                                VStack(spacing: scaledHeight(30)) {
                                    ForEach(todayOrderStore.todayOrderList.prefix(5), id: \.id) { order in
                                        HStack {
                                            TodayOrderDetailView(order: order, isToday: true)
                                            
                                            Image(.iconRight)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: isSimpleMode ? scaledHeight(30) : scaledHeight(24))
                                        }
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
                                }
                            }
                            .padding(.vertical, scaledHeight(20))
                            .padding(.horizontal, scaledWidth(25))
                        }
                        .background(.jgray100)
                        .cornerRadius(scaledWidth(10))
                        .padding(.bottom, scaledHeight(30))
                        
                        NavigationLink {
                            OrderHistoryListView(isToday: false)
                        } label: {
                            HStack(spacing: 0) {
                                Text("지난 주문 내역")
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
                            VStack(spacing: scaledHeight(30)) {
                                ForEach(todayOrderStore.pastOrderList.prefix(5), id: \.id) { order in
                                    PastOrderDetailView(order: order, isToday: false)
                                }
                            }
                            .padding(.vertical, scaledHeight(20))
                            .padding(.horizontal, scaledWidth(25))
                        }
                        .background(.jgray100)
                        .cornerRadius(scaledWidth(10))
                    }
                    .padding(.bottom, scaledHeight(76))
                }
                .padding(.leading, scaledWidth(44))
                .padding(.trailing, scaledWidth(45))
            }
            .scrollIndicators(.hidden)
            .background(.jgray95)
            .onAppear {
                todayOrderStore.getOrderToday()
                todayOrderStore.getOrderPast()
            }
        }
    }
}

#Preview {
    OrderHistoryView()
}
