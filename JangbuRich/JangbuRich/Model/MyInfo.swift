//
//  MyInfo.swift
//  JangbuRich
//
//  Created by 변상우 on 11/24/24.
//

import SwiftUI

struct StoreResult: Codable {
    let id: Int
    let ownerId: String
    let name: String
    let category: String
    let representativeImage: String
    let reservationAvailable: Bool?
    let maxReservation: Int?
    let minPrepayment: Int?
    let prepaymentDuration: Int?
    let introduction: String
    let latitude: Double
    let longitude: Double
    let address: String
    let location: String?
    let dayOfWeek: [String]
    let openTime: String
    let closeTime: String
}
