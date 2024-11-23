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
}
