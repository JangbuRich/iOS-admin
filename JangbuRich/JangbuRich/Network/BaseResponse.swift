//
//  BaseResponse.swift
//  JangbuRich
//
//  Created by 변상우 on 11/23/24.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let data: T?
    let transaction_time: String?
    let status: String?
    let description: String?
    let statusCode: Int?
}
