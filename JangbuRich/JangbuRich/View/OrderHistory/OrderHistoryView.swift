//
//  OrderHistoryView.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI

struct OrderHistoryView: View {
    
    @EnvironmentObject var overlayManager: OverlayManager
    
//    @State private var orderList: OrderDetailList = []
//    @State private var todayOrder: OrderDetail = []
//    @State private var pastOrder: OrderDetail = []

    @State private var orderList: OrderDetailList = OrderDetailList(
        orderNumber: "5",
        orderGroup: "미르미 그룹",
        orderName: "김장부",
        orderMenus: [
            OrderMenuList(menuTitle: "이탈리안 비엠티", menuNumberOfCount: "1"),
            OrderMenuList(menuTitle: "이탈리안 비엠티", menuNumberOfCount: "1"),
            OrderMenuList(menuTitle: "이탈리안 비엠티", menuNumberOfCount: "1")
        ],
        orderDate: "2024.11.23",
        orderTime: "10:30",
        orderTotalCount: "3",
        orderTotalPrice: "28,400"
    )
        
    @State private var todayOrder = [
        OrderDetail(orderNumber: "5", menuTitle: "이탈리안 비엠티 외 2개", numberOfMenu: "총 3개", orderDate: "2024.11.23", price: "9,700원"),
        OrderDetail(orderNumber: "5", menuTitle: "이탈리안 비엠티 외 2개", numberOfMenu: "총 3개", orderDate: "2024.11.23", price: "9,700원"),
        OrderDetail(orderNumber: "5", menuTitle: "이탈리안 비엠티 외 2개", numberOfMenu: "총 3개", orderDate: "2024.11.23", price: "9,700원"),
        OrderDetail(orderNumber: "5", menuTitle: "이탈리안 비엠티 외 2개", numberOfMenu: "총 3개", orderDate: "2024.11.23", price: "9,700원"),
        OrderDetail(orderNumber: "5", menuTitle: "이탈리안 비엠티 외 2개", numberOfMenu: "총 3개", orderDate: "2024.11.23", price: "9,700원"),
    ]
    
    @State private var pastOrder = [
        OrderDetail(orderNumber: "5", menuTitle: "이탈리안 비엠티 외 2개", numberOfMenu: "총 3개", orderDate: "2024.11.19", price: "9,700원"),
        OrderDetail(orderNumber: "5", menuTitle: "이탈리안 비엠티 외 2개", numberOfMenu: "총 3개", orderDate: "2024.11.19", price: "9,700원"),
        OrderDetail(orderNumber: "5", menuTitle: "이탈리안 비엠티 외 2개", numberOfMenu: "총 3개", orderDate: "2024.11.19", price: "9,700원"),
        OrderDetail(orderNumber: "5", menuTitle: "이탈리안 비엠티 외 2개", numberOfMenu: "총 3개", orderDate: "2024.11.19", price: "9,700원"),
        OrderDetail(orderNumber: "5", menuTitle: "이탈리안 비엠티 외 2개", numberOfMenu: "총 3개", orderDate: "2024.11.19", price: "9,700원"),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Image(.iconOrderHistory)
                            .resizable()
                            .scaledToFit()
                            .frame(height: scaledHeight(24))
                        
                        Text("주문 내역")
                            .font(.headline6)
                            .foregroundStyle(.jgray20)
                        
                        Spacer()
                    }
                    .padding(.top, scaledHeight(80))
                    .padding(.bottom, scaledHeight(20))
                    
                    VStack {
                        NavigationLink {
                            OrderHistoryListView(isToday: true, orderList: todayOrder, orderDetail: orderList)
                        } label: {
                            HStack(spacing: 0) {
                                Text("오늘의 주문 내역")
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
                            VStack {
                                HStack(spacing: scaledWidth(10)) {
                                    Image(.aiHelperButton)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: scaledHeight(34))
                                    
                                    HStack(spacing: scaledWidth(29)) {
                                        VStack {
                                            Text("오늘 총 주문")
                                                .font(.detail2)
                                                .foregroundStyle(.jgray30)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing) {
                                            Text("총 5건")
                                                .font(.label3)
                                                .foregroundStyle(.jgray50)
                                            
                                            Text("250,000원")
                                                .font(.headline2)
                                                .foregroundStyle(.jgray20)
                                        }
                                    }
                                }
                                
                                Divider()
                                    .frame(height: scaledHeight(1))
                                    .background(.jgray90)
                                    .padding(.vertical, scaledHeight(25))
                                
                                VStack(spacing: scaledHeight(30)) {
                                    ForEach(todayOrder, id: \.orderNumber) { order in
                                        HStack {
                                            OrderDetailView(order: order, isToday: true)
                                            
                                            Image(.iconRight)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: scaledHeight(24))
                                        }
                                        .onTapGesture {
                                            overlayManager.showSheet(
                                                OrderDetailPopupView(orderList: orderList)
                                            )
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
                            OrderHistoryListView(isToday: false, orderList: todayOrder, orderDetail: orderList)
                        } label: {
                            HStack(spacing: 0) {
                                Text("지난 주문 내역")
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
                            VStack {
                                ForEach(pastOrder, id: \.orderNumber) { order in
                                    OrderDetailView(order: order, isToday: false)
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
        }
    }
}

#Preview {
    OrderHistoryView()
}
