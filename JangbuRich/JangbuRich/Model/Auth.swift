//
//  Auth.swift
//  JangbuRich
//
//  Created by 변상우 on 11/19/24.
//

import SwiftUI

struct Token: Codable {
    let accessToken: String
    let accessTokenExpires: Int
    let refreshToken: String
    let refreshTokenExpires: Int
    let alreadyExists: Bool
}

struct CreateUserRequestDTO: Codable {
    var image: Data
    var store: OnboardingUser
    var menuImages: [Data]
}

struct OnboardingUser: Codable {
    var storeName: String
    var phoneNumber: String
    var businessName: String
    var businessRegistrationNumber: String
    var openingDate: String
    var agreeMarketing: Bool
    var agreeAdvertise: Bool
    var introduction: String
    var category: String
    var latitude: Double
    var longitude: Double
    var address: String
    var location: String
    var dayOfWeek: [String]
    var openTime: String
    var closeTime: String
    var menuCreateRequestDTOS: [MenuCreateRequestDTO]
    var minPrepayment: Int
    var prepaymentDuration: Int
    var reservationAvailable: Bool
    var maxReservation: Int
}

struct MenuCreateRequestDTO: Codable {
    var name: String
    var description: String
    var price: Int
}
