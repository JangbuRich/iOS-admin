//
//  Jangbu.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import SwiftUI

struct JangbuGroup {
    var groupName: String
    var groupDescription: String
    var groupPeriod: String
    var groupRemainPrice: String
}

struct JangbuHistory {
    var jangbuNumber: String
    var jangbuDate: String
    var jangbuGroupName: String
    var price: String
}

struct PaymentGroup: Codable {
    let id: Int
    let remainPoint: Int
    let teamId: Int
    let teamName: String
    let teamDescription: String
    let storeId: Int
    let period: String
}

struct PaymentHistory: Codable {
    let id: Int
    let createdAt: String
    let teamName: String
    let transactionedPoint: Int
}
