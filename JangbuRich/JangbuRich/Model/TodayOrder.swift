//
//  TodayOrder.swift
//  JangbuRich
//
//  Created by 변상우 on 11/24/24.
//

import Foundation

struct TodayOrderResult: Codable {
    let totalPrice: Int
    let ordersGetResponses: [TodayOrderList]?
}

struct TodayOrderList: Codable {
    let id: Int
    let menuNames: String
    let date: String
    let count: Int
    let price: Int
}

struct OrderDetailResult: Codable {
    let id: Int
    let teamName: String
    let teamUserName: String
    let menus: [Menu]
    let dateTime: String
    let amount: Int
    let totalPrice: Int
    let discountPrice: Int
}

struct Menu: Codable {
    let menuName: String
    let amount: Int
}

struct PastOrderResult: Codable {
    let id: Int
    let menuNames: String
    let date: String
    let count: Int
    let price: Int
}
